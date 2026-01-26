<?php // /index.php

//phpinfo();
include_once 'Dbconnexion.php';

$pdo = Dbconnexion::getInstance();

if (!$pdo) {
    die("La connexion à la base de donnée n'est pas établie.");
}

function main()
{
    global $pdo;
	$response = new response;
	$response->content_type('application/json');

	$path = explode('/', $_SERVER['REQUEST_URI']);
	if('' !== $path[0])
	{
		$response->bad_request();
		$response->body('Pas bon');
		$response->end();
	}
	array_shift($path);

	$entry_point = array_shift($path);
	if(!in_array($entry_point, ['bookmarks'], true))
	{
		$response->not_found();
		$response->json_body(['error' => sprintf('Entry point \'%s\' not found', $entry_point)]);
		$response->end();
	}

	switch($entry_point)
	{
		case 'bookmarks':
			//$source = new bookmarks;
            $source = new bookmarks_in_db($pdo);

			$id = array_shift($path);
			if(!is_numeric($id) && !is_null($id))
			{
				$response->not_found();
				$response->json_body(['error' => 'Resource not found']);
				$response->end();
			}

			$http_method = $_SERVER['REQUEST_METHOD'];
			if(is_null($id) && 'GET' === $http_method)
			{
				$payload = $source->all();
				$response->json_body($payload);
				$response->end();
			}

			if(!is_null($id))
			{
				$id = (int) $id;

				try
				{
					$bookmark = $source->get_one($id);
				}
				catch(bookmark_exception $e)
				{
					$response->not_found();
					$response->end();
				}
			}

			switch($http_method)
			{
				case 'GET':
					$response->json_body($bookmark);
					$response->end();
					break;
				case 'POST':
				case 'PUT':
					if(is_null($id))
					{
						$payload = file_get_contents('php://input');
						//if(false === $payload)
						$payload = json_decode($payload, JSON_THROW_ON_ERROR);
						$bookmark = new bookmark(
							title: $payload['title'],
							url: $payload['url']);

						$source->add_one($bookmark);
						$response->location(sprintf('/bookmarks/%d', $bookmark->id));
						$response->end();
					}

					break;
				case 'DELETE':
					if($source->delete_one($bookmark))
					{
						$response->location('/bookmarks');
						$response->end();
					}

					$response->not_found();
					$response->end();
					break;
				default:
					$response->method_not_allowed();
					$response->json_body(['error' => sprintf('Method \'%s\' on entry point \'%s\' not supported', $http_method, $entry_point)]);
					$response->end();
			}

			break;
	}
}

class response
{
	public function __construct(
		public array $header = [],
		public string $body = '',
	)
	{
	}

	function content_type(string $mime): void
	{
		$this->header[] = sprintf('Content-type: %s', $mime);
	}

	public function not_found()
	{
		$this->header[] = 'HTTP/1.1 404 Not Found';
	}

	public function method_not_allowed()
	{
		$this->header[] = 'HTTP/1.1 405 Method not allowed';
	}

	public function bad_request()
	{
		$this->header[] = 'HTTP/1.1 400 Bad Request';
	}

	public function body(string $payload): void
	{
		$this->body = $payload;
	}

	public function json_body(array|string|jsonserializable $payload): void
	{
		$this->body = json_encode($payload, JSON_THROW_ON_ERROR);
	}

	public function location(string $location)
	{
		$this->header[] = sprintf('Location: %s', $location); // XXX Header injection?!!
	}

	public function end(): void
	{
		foreach($this->header as $h)
			header($h);

		die($this->body);
	}
}

class bookmark implements jsonserializable
{
	public function __construct(
		public ?int $id = null,
		public ?string $title = null,
		public ?string $url = null
	)
	{
	}

	public function jsonSerialize(): mixed
	{
		return [ '_id' => $this->id
			, 'Title' => $this->title
			, 'URL' => $this->url
		];
	}
}

interface bookmark_collection
{
	function all(): array;
	/**
	 *  @throws bookmark_exception
	 */
	function get_one(int $id): bookmark;
	#[nodiscard]
	function delete_one(bookmark $b): bool;
	function add_one(bookmark $b): bool;
}

class bookmark_exception extends exception
{
}

class bookmarks_in_db implements bookmark_collection
{
    
	public function __construct(private PDO $dbConnect)
    {
        
    }

    function all(): array{
        
        $rq="Select id_bookmarks, title_bookmarks, url_bookmarks from bookmarks";
        $stmt = $this->dbConnect->query($rq);
        $data = $stmt->fetchAll();

        return $data;
    }
   	
    function get_one(int $id): bookmark
    {

	    $sql = 'Select id_bookmarks, title_bookmarks, url_bookmarks from bookmarks where id_bookmarks=:id';
	    $stmt = $this->dbConnect->prepare($sql);
	    $stmt->execute(['id' => $id]);
	    $row = $stmt->fetch();
        // verifie que row n't pas false
		if($row){
			$bookmark = new bookmark ($row['id_bookmarks'], $row['title_bookmarks'], $row['url_bookmarks']);
			return $bookmark;
		} else {

			throw new bookmark_exception("Erreur donnée inexistant", 1);	
		}

	}

	#[nodiscard]
	function delete_one(bookmark $b): bool{
		$sql = 'DELETE from bookmarks where id_bookmarks=:id';
	    $stmt = $this->dbConnect->prepare($sql);
		$stmt->bindParam(':id', $b->id);

		return @$stmt->execute();
    }

	function add_one(bookmark $b): bool{
		$sql = 'INSERT INTO bookmarks (title_bookmarks, url_bookmarks) VALUES (:title, :url)';
	    $stmt = $this->dbConnect->prepare($sql);
	    return $stmt->execute(['title' => $b->title, 'url' => $b->url]);
    }
}

class bookmarks implements bookmark_collection
{
	public function __construct(
		private array $all = []
	)
	{
		$this->all = include 'bookmark_fixtures.php';
	}

	function all(): array
	{
		return $this->all;
	}

	function get_one(int $id): bookmark
	{
		foreach($this->all as $b)
		{
			if($id === $b->id)
				return $b;
		}

		throw new bookmark_exception('Y\'a pas!');
	}

	function add_one(bookmark $b): bool
	{
		$b->id = rand(0, 1024);
		$this->all[] = $b;

		return true;
	}

	#[nodiscard]
	function delete_one(bookmark $b): bool
	{
		foreach($this->all as $k => $v)
			if($v->id === $b->id)
			{
				unset($this->all[$k]);
				return true;
			}

		return false;
	}
}

main();

<?php
namespace src\dao;
use \PDO;
use \Exception;


class CandidateRepository{
    private ?PDO $dbConnect;
    private int $nbCol;

    public function __construct()
    {
        $this->dbConnect=Dbconnexion::getInstance();
        $this->nbCol=0;
    }

    public function searchAll(): array {
        $data=[];
        $rq="Select id_user, lastname_user, firstname_user, email_user, pass_user, department_user, age_user, archive_user from candidats where archive_user = 0";
        $stmt = $this->dbConnect->query($rq);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $data;
    }

    public function searchAll2(): array {
        $data=[];
        $rq="Select lastname_user, firstname_user, email_user, department_user, age_user from candidats where archive_user = 0";
        $stmt = $this->dbConnect->query($rq);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $data;
    }

    public function insertCandidat(string $lastname_user, string $firstname_user, string $email_user, string $pass_user, int $department_user, int $age_user, int $archive_user): int
    {
        $rq = "INSERT INTO candidats (lastname_user, firstname_user, email_user, pass_user, department_user, age_user, archive_user) VALUES (:lastname, :firstname, :email, :password, :department, :age, :archive)";
        $PDOstmt = $this->dbConnect->prepare($rq);
        $PDOstmt->bindValue(":lastname", $lastname_user);
        $PDOstmt->bindValue(":firstname", $firstname_user);
        $PDOstmt->bindValue(":email", $email_user);
        $PDOstmt->bindValue(":password", $pass_user);
        $PDOstmt->bindValue(":department", $department_user);
        $PDOstmt->bindValue(":age", $age_user);
        $PDOstmt->bindValue(":archive", $archive_user);
        $PDOstmt->execute();
        return $PDOstmt->rowCount();
        
    }

    public function insertCandidat2(string $lastname, string $firstname, string $email, string $pass, int $department, int $age, int $archive=0): bool
    {
        $lastname= trim($lastname);
        $firstname= trim($firstname);
        $email=filter_var($email, FILTER_VALIDATE_EMAIL);
        $pass=password_hash(trim($pass), PASSWORD_ARGON2ID);
        $department=filter_var(trim($department), FILTER_VALIDATE_INT);
        $age=filter_var(trim($age), FILTER_VALIDATE_INT);

        $rq = "INSERT INTO candidats VALUES (id_user, :lastname, :firstname, :email, :pass, :department, :age, :archive)";
        $stmt = $this->dbConnect->prepare($rq);
        return $stmt->execute([
        ":lastname"=> $lastname,
        ":firstname"=> $firstname,
        ":email"=> $email,
        ":pass"=> $pass,
        ":department"=> $department,
        ":age"=> $age,
        ":archive"=>$archive
        ]);
        
    }

    public function deleteCandidats(int $_id): bool
    {
        $rq = "DELETE FROM candidats WHERE id = :ID";
        $PDOstmt = $this->dbConnect->prepare($rq);
        $PDOstmt->bindValue(":ID", $_id, PDO::PARAM_INT);
        return $PDOstmt->execute();
    }

    public function updateCandidats(int $_id, string $lastname_user, string $firstname_user, string $email_user, string $pass_user, int $department_user, int $age_user, int $archive_user): bool
    {
        $rq = "UPDATE candidats SET lastname_user=:lastname, firstname_user=:firstname, email_user=:email, pass_user=:password, department_user=:department, age_user=:age, archive_user=:archive WHERE id = :ID";
        $PDOstmt = $this->dbConnect->prepare($rq);
        $PDOstmt->bindValue(":ID", $_id, PDO::PARAM_INT);
        $PDOstmt->bindValue(":lastname", $lastname_user);
        $PDOstmt->bindValue(":firstname", $firstname_user);
        $PDOstmt->bindValue(":email", $email_user);
        $PDOstmt->bindValue(":password", $pass_user);
        $PDOstmt->bindValue(":department", $department_user);
        $PDOstmt->bindValue(":age", $age_user);
        $PDOstmt->bindValue(":archive", $archive_user);
        return $PDOstmt->execute();
    }

    public function exportToJSON(): bool {
        $data = $this->searchAll();
        /*$rq = "SELECT lastname_user, firstname_user, email_user, department_user, age_user FROM candidats";

        
            $stmt = $this->dbConnect->query($rq);
            $data = $stmt->fetchAll();

            if (empty($data)) {
                throw new Exception("Ne trouve pas de données à exporter.");
            }*/
        try {
            $chainedata = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

            $filePath = "../api/candidats_foire.json";
            
            if (file_put_contents($filePath, $chainedata) === false) {
                throw new Exception("N'a pas pu écrire le fichier.");
            }

            return true;
        } catch (Exception $e) {
            error_log($e->getMessage());
            return false;
        }
    }

    public function verifSign(string $mail,string $pass):array|false
    {
        $query="SELECT * FROM candidats WHERE email_user=:email_user";
        $stmt= $this->dbConnect->prepare($query);
        $stmt->execute([':email_user'=>$mail]);
        $user=$stmt->fetch();
        // $nligne=$stmt->rowCount(); // Ne pas utiliser avec SELECT
        if($user !== false && password_verify($pass,$user['pass_user'])){
            return $user;
        }
        return false;

    }

    public function verifSign2(string $_email, string $_pass): bool {
        $email = filter_var($_email, FILTER_VALIDATE_EMAIL);
        $pass = trim($_pass);

        // Check si l'email est valide
        if ($email === false) {
            return false; // Return false si l'email n'est pas valide
        }

        $sql = "SELECT * FROM candidats WHERE email_user = :email";
        $query = $this->dbConnect->prepare($sql);
        $query->execute(['email' => $email]);
        $fetch = $query->fetch();

        if ($fetch !== false && password_verify($pass, $fetch['pass_user'])) {
            return true;
        }
        
        return false;
    }
}

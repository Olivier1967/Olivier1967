<?php
namespace src\dao;
use \PDO;
use \Exception;

class DepartmentRepository
{
    private ?PDO $dbconnect=null;
    private $nbcol;
    private array $tabCol=[];
    
    public function __construct()
    {
        $this->dbconnect=Dbconnexion::getInstance();
        $query="SELECT * FROM departements";
        $stmt=$this->dbconnect->query($query);
        $this->nbcol=$stmt->rowCount();
    }

    public function searchAll():array {
        $query="SELECT id_dep, `Name` FROM departements";
        $stmt=$this->dbconnect->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll();
    }

}
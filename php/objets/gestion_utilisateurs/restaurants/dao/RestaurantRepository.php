<?php
class RestaurantRepository{
    private ?PDO $dbConnect;
    private int $nbCol;
    private array $tabNameCol=[];

    public function __construct()
    {
        $this->dbConnect=Dbconnexion::getInstance();
        $this->nbCol=0;
    }

    public function searchAll(): array {
        $data=[];
        $rq="Select id, nom, adresse, prix, commentaire, note, DATE_FORMAT(visite, \"%d/%m/%Y\") as \"date visite\" from restaurants";
        $stmt = $this->dbConnect->query($rq);
        $data = $stmt->fetchAll();

        return $data;
    }

    public function searchAllJSON():void {
        $data=[];
        $rq="Select id, nom, adresse, prix, commentaire, note, DATE_FORMAT(visite, \"%d/%m/%Y\") as \"date visite\" from restaurants";
        $stmt = $this->dbConnect->query($rq);
        $data = $stmt->fetchAll();
        $chainedata=json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
        file_put_contents("./API/listeresto.json", $chainedata);

    }

    public function searchById(int $_id){
        $rq = "Select nom, adresse, prix, commentaire, note, visite from restaurants where id=:ID";
        $PDOstmt = $this->dbConnect->prepare($rq);
        $PDOstmt->bindValue(":ID", $_id, PDO::PARAM_INT);
        $PDOstmt->execute();
        $data=$PDOstmt->fetch();
        return $data;
    }

    public function searchByName(string $_name){
        $rq = "Select nom, adresse, prix, commentaire, note, visite from restaurants where SOUNDEX(nom)=SOUNDEX(:nom)";
        $PDOstmt = $this->dbConnect->prepare($rq);
        $PDOstmt->bindValue(":nom", $_name, PDO::PARAM_STR);
        $PDOstmt->execute();
        $data=$PDOstmt->fetch();
        return $data;
    }

    public function searchByName2(string $_name){
        $rq = "Select id, nom, adresse, prix, commentaire, note, DATE_FORMAT(visite, \"%d/%m/%Y\") as \"date visite\" from restaurants where nom LIKE :nom";
        $PDOstmt = $this->dbConnect->prepare($rq);
        $like = '%' . $_name . '%';
        $PDOstmt->bindValue(":nom", $like, PDO::PARAM_STR);
        $PDOstmt->execute();
        $data=$PDOstmt->fetchAll();
        //$data=$PDOstmt->fetch();
        return $data;
    }

    public function searchByName3(string $_name):bool|array{
        $rq = "Select nom, adresse, prix, commentaire, note, visite from restaurants where SOUNDEX(nom)=SOUNDEX(:nom)";
        $PDOstmt = $this->dbConnect->prepare($rq);
        $PDOstmt->execute([":nom", $_name]);
        $data=$PDOstmt->fetchAll();
        return $data;
    }

    public function searchByTerm($term) {
        /* old date 2525-02-15
        $rq = "Select id, nom, adresse, prix, commentaire, note, DATE_FORMAT(visite, \"%d/%m/%Y\") as \"date_visite\" FROM restaurants WHERE nom LIKE :term OR adresse LIKE :term OR prix LIKE :term OR commentaire LIKE :term OR note LIKE :term OR visite LIKE :term";
        $PDOstmt = $this->dbConnect->prepare($rq);
        $likeTerm = '%' . $term . '%';
        $PDOstmt->bindParam(':term', $likeTerm, PDO::PARAM_STR);
        $PDOstmt->execute();
        $data=$PDOstmt->fetchAll();
        //$PDOstmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
        */
        
        // Check if the term is a date in DD/MM/YYYY format
        $date = DateTime::createFromFormat('d/m/Y', $term);
        $dateMatched = false;

        if ($date) {
            // If it's a valid date, convert it to YYYY-MM-DD format
            $term = $date->format('Y-m-d');
            $dateMatched = true;
        }

        $rq = "SELECT id, nom, adresse, prix, commentaire, note, DATE_FORMAT(visite, \"%d/%m/%Y\") as date_visite 
                FROM restaurants 
                WHERE nom LIKE :term OR adresse LIKE :term OR prix LIKE :term OR commentaire LIKE :term OR note LIKE :term";

        // If it is a date, add a specific condition to check for the 'visite' date
        if ($dateMatched) {
            $rq .= " OR visite = :dateTerm";
        }

        $PDOstmt = $this->dbConnect->prepare($rq);

        // Prepare a parameter for LIKE searches
        $likeTerm = '%' . $term . '%';
        $PDOstmt->bindParam(':term', $likeTerm, PDO::PARAM_STR);

        // Bind the date param only if it's a valid date
        if ($dateMatched) {
            $PDOstmt->bindParam(':dateTerm', $term, PDO::PARAM_STR);
        }

        $PDOstmt->execute();
        $data = $PDOstmt->fetchAll();

        return $data;
    }

    public function searchByNote(float $_limite):bool|array{
        $rq = "CALL afficherlistenote(:note)";
        $stmt = $this->dbConnect->prepare($rq);
        $stmt->bindValue(":note", $_limite);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function insertRestaurants(string $nom, string $adresse, float $prix, string $commentaire, float $note, DateTime $ddate): bool {

        $visite= $ddate -> format('Y-m-d');

        /** @var PDO $db connexion à la base de données */
        //$db = Dbconnect::getInstance();

        /** @var $nblines stockera le nombre de lignes affectées par la requête */
        $nblines = 0;

        $rq ="INSERT INTO restaurants (nom, adresse, prix, commentaire, note, visite) VALUES (:nom, :adresse, :prix, :commentaire, :note, :visite)";

        /** @var PDOStatement $stmt initialisation de la requête préparée */
        $stmt = $this->dbConnect->prepare($rq);

        // exécution de la requêtes préparée
        // execute() retourne true si la requête a été exécutée avec succés, sinon false
         // Exécution de la requête préparée et gestion des erreurs
        try {
            if ($stmt->execute([
                ':nom' => $nom,
                ':adresse' => $adresse,
                ':prix' => $prix,
                ':commentaire' => $commentaire,
                ':note' => $note,
                ':visite' => $visite
            ])) {
                // Récupération du nombre de lignes affectées par la requête
                $nblines = $stmt->rowCount();
            }
        } catch (PDOException $e) {
            // Log de l'erreur ou gestion de l'exception
            error_log('Erreur lors de l\'insertion: '.$e->getMessage());
            return false;
        }

        // fermeture de la requête (pour libérer les ressources)
        $stmt->closeCursor();

        // Retourne le résultat. 
        // Si le nombre de lignes affectées est égal à 1, les données ont bien été insérées
        return $nblines == 1;
    }

    public function searchByPrix(float $_limite_inf, float $_limite_sup):bool|array{

        $stmt= $this->dbConnect->prepare("CALL afficherEntreDeux(:limiteinf, :limitesup)");
        $stmt->execute([":limiteinf"=>$_limite_inf, ":limitesup"=>$_limite_sup]);
        return $stmt->fetchAll();
    }

    public function createRestaurant(string $_nom, string $_adresse, float $_prix, string $_commentaire, float $_note, DateTime $_visite): bool
    {
        $nom=htmlspecialchars($_nom);
        $adresse=htmlspecialchars($_adresse);
        $prix=floatval($_prix);
        $commentaire=htmlspecialchars($_commentaire);
        $note=floatval($_note);
        $madate=$_visite->format('Y-m-d');
       // $madate= date_format($_visite, 'Y-m-d');
        
         



        $rq = "INSERT INTO restaurants (nom, adresse, prix, commentaire, note, visite) VALUES (:nom, :adresse, :prix, :commentaire, :note, :visite)";
        $PDOstmt = $this->dbConnect->prepare($rq);
        $PDOstmt->bindValue(":nom", $nom);
        $PDOstmt->bindValue(":adresse", $adresse);
        $PDOstmt->bindValue(":prix", $prix);
        $PDOstmt->bindValue(":commentaire", $commentaire);
        $PDOstmt->bindValue(":note", $note);
        $PDOstmt->bindValue(":visite", $madate);
        return $PDOstmt->execute();
    }



    public function deleteRestaurant(int $_id): bool
    {
        $rq = "DELETE FROM restaurants WHERE id = :ID";
        $PDOstmt = $this->dbConnect->prepare($rq);
        $PDOstmt->bindValue(":ID", $_id, PDO::PARAM_INT);
        return $PDOstmt->execute();
    }

    public function updateRestaurant(int $_id, string $_nom, string $_adresse, float $_prix, string $_commentaire, float $_note, string $_visite): bool
    {
        $rq = "UPDATE restaurants SET nom = :nom, adresse = :adresse, prix = :prix, commentaire = :commentaire, note = :note, visite = :visite WHERE id = :ID";
        $PDOstmt = $this->dbConnect->prepare($rq);
        $PDOstmt->bindValue(":ID", $_id, PDO::PARAM_INT);
        $PDOstmt->bindValue(":nom", $_nom);
        $PDOstmt->bindValue(":adresse", $_adresse);
        $PDOstmt->bindValue(":prix", $_prix);
        $PDOstmt->bindValue(":commentaire", $_commentaire);
        $PDOstmt->bindValue(":note", $_note);
        $PDOstmt->bindValue(":visite", $_visite);
        return $PDOstmt->execute();
    }   

}
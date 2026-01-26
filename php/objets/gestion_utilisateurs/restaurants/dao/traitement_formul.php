<?php
// traitement.php avec persistance des données
require_once './Dbconnexion.php';
require_once './RestaurantRepository.php';

$objResto = new RestaurantRepository();

// Si la méthode HTTP de la requête est "POST"
if (!empty($_POST)) { 
    try {
        if (!isset($_POST['nom'], $_POST['adresse'], $_POST['prix'], $_POST['commentaire'], $_POST['note'], $_POST['visite'])) {
            throw new Exception('Le formulaire est incomplet');
        }

        // Récupérer les données du formulaire
        $nom = htmlspecialchars($_POST['nom']);
        $adresse = htmlspecialchars($_POST['adresse']);
        $prix = htmlspecialchars($_POST['prix']);
        $commentaire = htmlspecialchars($_POST['commentaire']);
        $note = htmlspecialchars($_POST['note']);
        $visite = $_POST['visite'];

        // Conversion de la date 'visite' en objet DateTime
        try {
            $ddate = new DateTime($visite);
            $currentDate = new DateTime();
            if ($ddate >= $currentDate) {
                throw new Exception('La date doit être avant aujourd\'hui !');
            }
        } catch (Exception $e) {
            throw new Exception('Erreur de format de la date : ' . $e->getMessage());
        }

        // Sauvegarde dans la base de données et affichage du résultat
        if ($objResto->insertRestaurants($nom, $adresse, $prix, $commentaire, $note, $ddate)) {
            $message = 'Les données ont bien été sauvegardées';
        } else {
            $message = 'Erreur lors de la sauvegarde des données';
        }

        // Affichage du message
        $messageHtml = '<div class="alert alert-success">' . $message . '</div>';
        
    } catch(Exception $ex) {
        $messageHtml = '<div class="alert alert-danger">' . $ex->getMessage() . '</div>';
    }    
}
?>

<!DOCTYPE html>
<html lang="fr-FR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/menu.css" media="screen" type="text/css" />
    <title>Traitement</title>
</head>
<body>

    <div class="container mt-5">
        <main class="bg-dark text-light p-4 rounded">
            <h1 class="text-center">Résultat du Traitement</h1>
            <section>
                <?php if (isset($messageHtml)) echo $messageHtml; ?>
                <div class="text-center">
                    <a href="../formulaire.php" class="btn btn-primary">Retour au formulaire</a>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
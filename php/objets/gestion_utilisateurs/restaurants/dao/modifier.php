<?php
require "./Dbconnexion.php";
require "./RestaurantRepository.php";

if (isset($_GET['id'])) {
    $id = (int)$_GET['id'];
    $objResto = new RestaurantRepository();
    $restaurant = $objResto->searchById($id);

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $nom = $_POST['nom'];
        $adresse = $_POST['adresse'];
        $prix = $_POST['prix'];
        $commentaire = $_POST['commentaire'];
        $note = $_POST['note'];
        $visite = $_POST['visite'];

        if ($objResto->updateRestaurant($id, $nom, $adresse, $prix, $commentaire, $note, $visite)) {
            echo "Mise à jour des données réussie !";
            header("Location: ../viewTable.php"); 
            exit();
        } else {
            echo "Erreur de mise à jour.";
        }
    }

    // HTML view
    ?>
<!DOCTYPE html>
<html lang="fr-FR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/menu.css" media="screen" type="text/css" />
    <link rel="stylesheet" href="../css/view.css">
    <title>Modification de Restaurant</title>
</head>
<body>

    <div class="container mt-5">
        <main class="bg-dark text-light p-4 rounded">
            <h1 class="text-center">Modifications de Champs</h1>

            <section>
                <form method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="nom" value="<?= htmlspecialchars($restaurant['nom']) ?>" required>
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-control" name="adresse" value="<?= htmlspecialchars($restaurant['adresse']) ?>" required>
                    </div>

                    <div class="form-group">
                        <input type="number" class="form-control" name="prix" value="<?= htmlspecialchars($restaurant['prix']) ?>" required>
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-control" name="commentaire" value="<?= htmlspecialchars($restaurant['commentaire']) ?>" required>
                    </div>

                    <div class="form-group">
                        <input type="number" step="0.1" class="form-control" name="note" value="<?= htmlspecialchars($restaurant['note']) ?>" required>
                    </div>

                    <div class="form-group">
                        <input type="date" class="form-control" name="visite" value="<?= htmlspecialchars($restaurant['visite']) ?>" required>
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary">Mettre à jour</button>
                    </div>
                </form>
            </section>
        </main>
    </div>
</body>
</html>
<?php
} else {
    echo "Aucun ID fourni.";
}
<!DOCTYPE html>
<html lang="fr-FR">
<head>
    <meta charset="utf-8">
    <title>Formulaire</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/menu.css" media="screen" type="text/css" />
    <script src="./js/submit.js"></script>
</head>
<body>
    <?php
    require_once "./view/header.php";
    ?>

    <div class="container mt-5">
        <form id="contact" action="./dao/traitement_formul.php" method="post" class="bg-dark text-light p-4 rounded">
            <h3 class="text-center">Critique de Restaurants</h3>

            <div class="form-group">
                <input type="text" class="form-control" placeholder="Nom" name="nom" required autofocus>
            </div>
            
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Adresse" name="adresse" required>
            </div>

            <div class="form-group">
                <input type="number" class="form-control" placeholder="Prix" name="prix" required>
            </div>
            
            <div class="form-group">
                <textarea class="form-control" placeholder="Commentaires..." name="commentaire" required></textarea>
            </div>
            
            <div class="form-group">
                <input type="number" class="form-control" placeholder="Note" name="note" required>
            </div>

            <div class="form-group">
                <label for="visite">Visite:</label>
                <input type="date" class="form-control" name="visite" required>
            </div>

            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary" name="submit">Envoyer</button>
            </div>
        </form>
    </div>
</body>
</html>
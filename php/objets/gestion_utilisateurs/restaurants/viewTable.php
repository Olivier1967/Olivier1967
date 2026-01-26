<!DOCTYPE html>
<html lang="fr-FR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/menu.css" media="screen" type="text/css" />
    <link rel="stylesheet" href="./css/view.css" media="screen" type="text/css" />
    <title>Table</title>
</head>
<body>
    <?php
        require_once "./view/header.php"
    ?>
    <h1>Liste des critiques des restaurants</h1>
    	<form action = "#" method = "GET" id="search">
		    <input type = "search" name = "terme">
		    <input type = "submit" name = "search" value = "Rechercher dans la liste">
		</form>

    <main class="cadre">
        <section>

            <div id="mytable"><?php
                require "./dao/Dbconnexion.php";
                require "./dao/RestaurantRepository.php";
                require "./view/tableau.php"; 

                $objResto = new RestaurantRepository();
                
                // ternaire
                $terme = isset($_GET['terme']) ? htmlspecialchars($_GET['terme']) : null;

                $data = (isset($terme) && !empty($terme)) ? $objResto->searchByTerm($terme) : $objResto->searchAll();
                

                
                // ancien code avec if
                /*
                $terme = $_GET['terme'];

                if (empty($terme)) {
                    $data = $objResto->searchAll();
                } else {
                    //$data=$objResto->searchByName2($terme); // recherche dans un seul champ
                    $data=$objResto->searchByTerm($terme);
                }
                */
    
                if ($data && count($data) > 0) {
                    echo afficherTableau($data);
                    $objResto->searchAllJSON();
                } else {
                    echo "<p>Aucune donnée à afficher.</p>"; 
                }
            ?></div>
            <br>

        </section>


        
    </main>
    
</body>
</html>
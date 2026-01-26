<?php

// Chemin vers le fichier contenant la clé
$keyFile = './data/key.php';

// Si le fichier n'existe pas
if(!is_file($keyFile)) {
    // On soulève une exception
    throw new Exception('API Key not found!');
}

$key = require ($keyFile);
//exit($key);

// Création d'un flux
$opts = [
    'http'=> [
        'method' => "GET",
        'header' => "Authorization: Bearer  $key"
    ]
];

$context = stream_context_create($opts);
$data = null;

if ($_SERVER["REQUEST_METHOD"] === "POST" && !empty($_POST['recherche'])) { 
    $recherche = urlencode(filter_var($_POST['recherche']));
    $url = 'https://api.le-systeme-solaire.net/rest/bodies/' . $recherche;

    $file = file_get_contents($url, false, $context);

    if ($file === false) {
        $error = "Erreur de retrait de données.";
    } else {
        $data = json_decode($file, true);
    }
}

header('Content-Type: text/html; charset=utf-8');
?>

<!DOCTYPE html>
<html lang="fr-FR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Planètes</title>
</head>
<body>
    <main>
        <h1>Planètes</h1>
        <form method="POST" action="">
            <label for="planet">Quelle planète voulez-vous ?</label>
            <input type="text" name="recherche" required>
            <input type="submit" value="Envoyer">
        </form>
        
        <div id="planetes">
            <?php 
            if (isset($error)) {
                echo "<p>" . htmlspecialchars($error) . "</p>";
            } elseif ($data) {
                echo "<p>Name: " . htmlspecialchars($data['name']) . "</p>";
                echo "<p>Type de Corps: " . htmlspecialchars($data['bodyType']) . "</p>";
                echo "<p>Mass: " . htmlspecialchars($data['mass']['massValue']) . "</p>";
                echo "<p>Orbit sidéral: " . htmlspecialchars($data['sideralOrbit']) . "</p>";
                echo "<p>Periheli: " . htmlspecialchars($data['perihelion']) . "</p>";
                echo "<p>Apheli: " . htmlspecialchars($data['aphelion']) . "</p>";
            }
            ?>
        </div>
    </main>
</body>
</html>
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
    $url2 = 'https://api.le-systeme-solaire.net/rest/bodies/';

    $file = file_get_contents($url, false, $context);
    $file2 = file_get_contents($url2, false, $context);

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
                //echo "<p>Lunes: " . htmlspecialchars($data['moons']) . "</p>";
                
                // Check if moons exists and is an array
                if (isset($data['moons']) && is_array($data['moons'])) {
                    $moonList = [];
                    foreach ($data['moons'] as $moon) {
                        // Extracting moon name and its relation if they exist
                        $moonName = htmlspecialchars($moon['moon'] ?? 'Unknown Moon');
                        //$moonRel = htmlspecialchars($moon['rel'] ?? 'Unknown Relation');
                        //$moonList[] = "$moonName (Relation: $moonRel)";
                        $moonList[] = "$moonName";
                    }
                    echo "<p>Lunes: " . implode(', ', $moonList) . "</p>";
                } else {
                    echo "<p>Lunes: Donnés sur les lunes non disponible.</p>";
                }
            }
                //echo "fichier = ", $file2;
            ?>
        </div>
    </main>
</body>
</html>
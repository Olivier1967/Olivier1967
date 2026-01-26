<?php
require_once 'vendor/autoload.php';
use GuzzleHttp\Client;
use GuzzleHttp\Promise\EachPromise;

function afficherPlanets($planets) {
    $output = '<thead>';
    $output .= '<tr>';
    $output .= insertTitleCell('Nom');
    $output .= insertTitleCell('Nom anglais');
    $output .= insertTitleCell('Lune');
    $output .= insertTitleCell('Orbit sidérale');
    $output .= insertTitleCell('Mass');
    $output .= insertTitleCell('Volume');
    $output .= '</tr></thead>';

    $output .= '<tbody>';

    foreach ($planets as $planet) {
        $output .= '<tr>';
        $output .= '<td>' . htmlspecialchars($planet['name']) . '</td>';
        $output .= '<td>' . htmlspecialchars($planet['englishName']) . '</td>';
        $output .= '<td>' . (isset($planet['moons']) ? htmlspecialchars(implode(', ', array_column($planet['moons'], 'moon'))) : 'N/A') . '</td>';
        $output .= '<td>' . htmlspecialchars($planet['sideralOrbit']) . '</td>';
        $output .= '<td>' . formatMass($planet) . '</td>';
        $output .= '<td>' . formatVolume($planet) . '</td>';
        $output .= '</tr>';
    }

    $output .= '</tbody>';
    return $output;
}

function insertTitleCell($value) {
    return '<th>' . htmlspecialchars($value) . '</th>';
}

function formatMass($planet) {
    if (isset($planet['mass'])) {
        return $planet['mass']['massValue'] . ' x 10<sup>' . $planet['mass']['massExponent'] . '</sup>';
    }
    return 'N/A';
}

function formatVolume($planet) {
    if (isset($planet['vol'])) {
        return $planet['vol']['volValue'] . ' x 10<sup>' . $planet['vol']['volExponent'] . '</sup>';
    }
    return 'N/A';
}

$client = new Client();
$output = '';

try {
// Chemin vers le fichier contenant la clé
$keyFile = dirname(__DIR__) .'/data/key.php';

// Si le fichier n'existe pas
if(!is_file($keyFile)) {
    // On soulève une exception
    throw new Exception('API Key not found!');
}

$key = require ($keyFile);

//exit($key);
    // Fetch all bodies (planets and moons)
    $response = $client->request('GET', 'https://api.le-systeme-solaire.net/rest/bodies/', [
        'headers' => [
            'Authorization' => ('Bearer '. $key),
            'Accept' => 'application/json'
        ]
    ]);

    // Get the response body
    $responseBody = (string) $response->getBody();

    // Remove control characters
    $sanitizedData = preg_replace('/[\x00-\x1F\x7F]/', '', $responseBody);

    // Decode the sanitized JSON
    $result = json_decode($sanitizedData, true);

    // Check for JSON errors
    if (json_last_error() !== JSON_ERROR_NONE) {
        echo 'JSON parsing error: ' . json_last_error_msg();
        return;
    }

    if (isset($result['bodies']) && is_array($result['bodies']) && !empty($result['bodies'])) {
        // Filter only planets for display
        $planets = array_filter($result['bodies'], function($body) {
            return isset($body['isPlanet']) && $body['isPlanet']; // Keeping only planets
        });

        if (!empty($planets)) {
            $output .= afficherPlanets($planets); // Pass the array directly to afficherPlanets
        } else {
            $output .= "<tr><td colspan='100'>No planets found.</td></tr>";
        }
    } else {
        $output .= "<tr><td colspan='100'>No data found or invalid format.</td></tr>";
    }

} catch (Exception $e) {
    $output .= "<tr><td colspan='100'>Error: " . htmlspecialchars($e->getMessage()) . "</td></tr>";
}

echo $output;
<?php


$chaineMK = '__Essai bibliothèque__ ***Essai bibliothèque*** <u>Essai bibliothèque</u>';

use Michelf\Markdown;
require "./vendor/autoload.php";
$chaineHTML=Markdown::defaultTransform($chaineMK);

echo $chaineHTML;


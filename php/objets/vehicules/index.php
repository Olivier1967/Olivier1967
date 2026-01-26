<?php
require_once "./Voitures.php";
require_once "./Moteur.php";
require_once "./VoitureCourse.php";

$maVoiture = new Voitures("renault", 250, "peugeot", "208", 1400);

echo $maVoiture;

$maVoituredeCourse = new VoitureCourse("bmw", 250, "bmw", "bmwX2", 1400);

echo $maVoituredeCourse;
<?php
use src\dao\CandidateRepository;

function ctrlAccueil(){
    $ojbCandidat= new CandidateRepository();

    $dataCandidat=$ojbCandidat->searchAll2();

    include "./src/view/home.php";
}

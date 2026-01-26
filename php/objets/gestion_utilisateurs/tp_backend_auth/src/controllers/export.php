<?php
session_start();

use src\dao\CandidateRepository;

require '../dao/CandidateRepository.php';
require '../dao/Dbconnexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['export'])) {
    $ojbJason = new CandidateRepository();
    
    $exportSuccess = $ojbJason->exportToJSON();

    if ($exportSuccess) {
        $_SESSION['msg'] = "Exportation réussi"; 
    } else {
        $_SESSION['msg'] = "Exportation échouée";
    }

    header("Location: http://localhost/objets/gestion_utilisateurs/tp_backend_auth/index.php?page=home");
    exit;
} else {
    echo "Demande invalide";
}
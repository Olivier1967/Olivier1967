<?php
use src\dao\CandidateRepository;
use src\dao\departmentRepository;

function ctrlInscription()
{

    $objCandidat = new CandidateRepository();

    $objDept = new departmentRepository();
    $tabData = $objDept->searchAll();
    //var_dump($tabData);

     $errors = [];

    // efface les champs
    $lastname = '';
    $firstname = '';
    $email = '';
    $department = '';
    $age = '';

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {

        $lastname = trim($_POST['lastname']);
        $firstname = trim($_POST['firstname']);
        $email = ($_POST['email']);
        $password = trim($_POST['password']);
        $confirmPassword = trim($_POST['confirmPassword']);
        $department = ($_POST['department']);
        $age = ($_POST['age']);

        if (empty($lastname) || empty($firstname)  || empty($email) || empty($password) || empty($confirmPassword) || empty($department) || empty($age)) {
            $errors[] = "Tous les champs sont obligatoires.";
        } else {
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $errors[] = "Veuillez entrer un email valide.";
            }

            if ($password !== $confirmPassword) {
                $errors[]= "Les mots de passe ne correspondent pas.";
            } elseif ($age <= 18){
                    $errors[]= "Vous devez avoir au moins 18 ans pour vous inscrire.";
                } else {
                    $test = $objCandidat->insertCandidat2($lastname, $firstname, $email, $password, $department, $age);
                    if ($test) {
                        $errors[]=  "insertion candidat reussi";
                                $lastname = "";
                                $firstname = "";
                                $email = "";
                                $department = "";
                                $age = 0;
                        header("Location: index.php?page=home");
                    }else{
                         $errors[] = "Erreur lors de l'insertion des données.";
                    }
                }
            }
        }


    require "./src/view/inscription.php";
}
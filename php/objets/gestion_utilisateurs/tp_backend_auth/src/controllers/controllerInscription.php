<?php
use src\dao\CandidateRepository;

function controllerInscription()
{
    if (!empty($_POST)) {
        $lastname_user = trim($_POST['username']);
        $firstname_user = trim($_POST['firstname']);
        $email_user = trim($_POST['email']);
        $pass_user = trim($_POST['password']);
        $confirmPassword = trim($_POST['confirmPassword']);
        $department_user = trim($_POST['department']);
        $age_user = trim($_POST['age']);
        $archive_user = 0;
        $hashedPassword = password_hash($pass_user, PASSWORD_ARGON2ID);

        // Check si les champs sont vide
        if (empty($lastname_user) || empty($firstname_user) || empty($email_user) || empty($pass_user) || empty($confirmPassword) || empty($department_user) || empty($age_user)) {
           echo "Remplissez tous les champs !";
            // header('location: ../registration.php');
            // exit;
        } else {
            if ($pass_user !== $confirmPassword) {
                echo "Les mots de passe ne correspondent pas !";
            } else {

                $objCandidat = new CandidateRepository();
                $nbRow = $objCandidat->insertCandidat($lastname_user, $firstname_user, $email_user, $hashedPassword, $department_user, $age_user, $archive_user);
                if ($nbRow == 1) {
                    echo "insertion réussi.";
                    sleep(2);
                  echo "<script>window.location.href = './index.php';</script>";
                exit();
                }else{
                    echo "Erreur veuillez remplir correctement le formulaire.";
                }
            }
        }

    } 
    
    require "./src/view/inscription.php";

};

<?php
// temporaire :
use src\dao\CandidateRepository;

function ctrlLogin():void
{
    $objCandidat = new CandidateRepository();

    $errors = [];
    
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $email = trim($_POST['username']);
            $password = $_POST['password'];

            $errors = [];

            if (empty($email) || empty($password)) {
                $errors[] = "Tous les champs sont obligatoires.";
            } else {
                $user = $objCandidat->verifSign($email, $password);

                if ($user !== false) {
                    echo  "Connexion réussie";
                    //sleep(3);
                    $_SESSION['user_id'] = $user['id'];
                    $_SESSION['nom'] = $user['lastname_user'];
                    $_SESSION['prenom']=$user['firstname_user'];
                    header("Location: index.php?page=compteperso");
                    exit();
                } else {
                    $errors[] = "Email ou mot de passe incorrect.";
                }
            }
        }
    require "./src/view/login.php";
}

/* avec tentatives
use src\dao\CandidateRepository;

function ctrlLogin(): void
{
    $objCandidat = new CandidateRepository();
    $errors = [];
    $maxAttempts = 3; 
    $lockDuration = 60; // Lock duration in seconds (1 minute)

    // Initialize session variables if not set
    if (!isset($_SESSION['tentative_login'])) {
        $_SESSION['tentative_login'] = 0;
        $_SESSION['tmp_verrouillage'] = 0;
        $_SESSION['show_alert'] = false; // Flag for showing alert
    }

    // Check the locking condition based on attempts
    if ($_SESSION['tentative_login'] >= $maxAttempts) {
        // Check if lock duration has not expired
        if (time() - $_SESSION['tmp_verrouillage'] < $lockDuration) {
            $_SESSION['show_alert'] = true; // Set alert flag
            //header("Location: index.php?page=login");
            exit();
        } else {
            // Reset if the lock duration has passed
            $_SESSION['tentative_login'] = 0;
            $_SESSION['tmp_verrouillage'] = 0;
            $_SESSION['show_alert'] = false; // Reset alert flag
        }
    }

    // Proceed with login if not locked
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $email = trim($_POST['username']);
        $password = $_POST['password'];

        if (empty($email) || empty($password)) {
            $errors[] = "Tous les champs sont obligatoires.";
        } else {
            $user = $objCandidat->verifSign($email, $password);

            if ($user !== false) {
                // Successful login
                echo "Connexion réussie";
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['nom'] = $user['lastname_user'];
                $_SESSION['prenom'] = $user['firstname_user'];
                header("Location: index.php?page=compteperso");
                exit();
            } else {
                // Increment the number of login attempts
                $_SESSION['tentative_login']++;
                $_SESSION['tmp_verrouillage'] = time(); // Record the time of the failed attempt
                $errors[] = "Email ou mot de passe incorrect.";

                // Lock account if maximum attempts are reached
                if ($_SESSION['tentative_login'] >= $maxAttempts) {
                    $errors[] = "Nombre maximum de tentatives atteint. Compte verrouillé pour 1 minute.";
                }
            }
        }
    }

    require "./src/view/login.php";
}
*/




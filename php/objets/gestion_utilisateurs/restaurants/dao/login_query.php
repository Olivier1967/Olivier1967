<?php
session_start();
require_once './Dbconnexion.php';

$nbessai = 3; //  3 tentatives de login max
$tmp_attente = 100; // temps d'attente (2 minutes)

$pdo = Dbconnexion::getInstance(); 
if (!$pdo) {
    die("La connexion à la base de donnée n'est pas établie.");
}

if (!isset($_SESSION['tentative_login'])) {
    $_SESSION['tentative_login'] = 0;
    $_SESSION['tmp_verrouillage'] = 0;
}

if (isset($_POST['login'])) {
    // Check si l'utilisateur est bloqué
    if ($_SESSION['tentative_login'] >= $nbessai) {
        if (time() - $_SESSION['tmp_verrouillage'] < $tmp_attente) {
            echo "<script>alert('Trop de tentative. Réessayez plus tard.')</script>";
            echo "<script>window.location = '../index.php'</script>";
            exit();
        } else {
            // Remet a zéro si le temps est passé
            $_SESSION['tentative_login'] = 0;
            $_SESSION['tmp_verrouillage'] = 0;
        }
    }

    if ($_POST['username'] != "" && $_POST['password'] != "") {
        $username = $_POST['username'];
        $password = $_POST['password'];

        $sql = "SELECT users_id, users_name, users_password FROM `db_users` WHERE `users_name` = ?";
        $query = $pdo->prepare($sql);   
        $query->execute([$username]); 
        
        if ($query->rowCount() > 0) {
            $fetch = $query->fetch();
            if (password_verify($password, $fetch['users_password'])) {
                $_SESSION['user'] = $fetch['id'];
                $_SESSION['tentative_login'] = 0; // remet a zéro si réussi
                header("Location: ../menu.php");
                exit();
            } else {
                $_SESSION['tentative_login']++;
                echo "<script>alert('Username ou mot de pass invalide. Vous avez encore ".($nbessai - $_SESSION['tentative_login'])." essais.')</script>";
                if ($_SESSION['tentative_login'] >= $nbessai) {
                    $_SESSION['tmp_verrouillage'] = time();
                }
                echo "<script>window.location = '../index.php'</script>";
            }
        } else {
            $_SESSION['tentative_login']++;
            echo "<script>alert('Username ou mot de pass invalide. Vous avez encore ".($nbessai - $_SESSION['tentative_login'])." essais.')</script>";
            if ($_SESSION['tentative_login'] >= $nbessai) {
                $_SESSION['tmp_verrouillage'] = time();
            }
            echo "<script>window.location = '../index.php'</script>";
        }
    } else {
        echo "<script>alert('Complètez les champs manquant !')</script>";
        echo "<script>window.location = '../index.php'</script>";
    }
}
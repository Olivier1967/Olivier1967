<?php
session_start();
require_once './Dbconnexion.php';

$pdo = Dbconnexion::getInstance();

if (!$pdo) {
    die("La connexion à la base de donnée n'est pas établie.");
}

if (isset($_POST['register'])) {
 
    $users_name = trim($_POST['username']);
    var_dump($users_name); //pour voir l'erreur
    $users_password = trim($_POST['password']);
    $confirmPassword = trim($_POST['confirmPassword']);

    // Check si les champs sont vide
    if (empty($users_name) || empty($users_password) || empty($confirmPassword)) {
        $_SESSION['error'] = "Remplissez tous les champs !";
        header('location: ../registration.php');
        exit;
    }

    // regarde que les mots de passe correspondent
    if ($users_password !== $confirmPassword) {
        $_SESSION['error'] = "Les mots de passe ne correspondent pas !";
        header('location: ../index.php');
        exit;
    }

    // Check if the username exists
    $sql = "SELECT * FROM db_users WHERE users_name = :users_name";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':users_name', $users_name);
    $stmt->execute();
    
    if ($stmt->rowCount() > 0) {
        $_SESSION['error'] = "Ce nom d’utilisateur est déjà pris !";
        header('location: ../index.php');
        exit;
    }

    // Securiser le mot de passe
    $hashedPassword = password_hash($users_password, PASSWORD_DEFAULT);


    try {
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "INSERT INTO db_users (users_name, users_password) VALUES (:users_name, :users_password)";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':users_name', $users_name);
        $stmt->bindParam(':users_password', $hashedPassword);
        $stmt->execute();

        $_SESSION['message'] = array("text" => "Utilisateur a été créé", "alert" => "info");
        header('location: ../index.php');
        exit;
    } catch (PDOException $e) {
        $_SESSION['error'] = "Une erreur est survenue en créant l'utilisateur. Réessayer plus tard.";
        header('location: ../registration.php');
        exit;
    }
}
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nom = $_POST['nom'];
    $email = $_POST['email'];
    $message = $_POST['message'];
    
    // Ici, vous pourriez envoyer le message par email ou le stocker dans une base de données
    echo "Merci $nom, votre message a été envoyé!";
}
?>
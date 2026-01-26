<?php
    echo "<h1>Bienvenue sur mon site web</h1>";
    echo "<p>Ceci est ma première page construite avec PHP.</p>";
?>

<form method="post" action="contact.php">
    Nom: <input type="text" name="nom" require><br>
    Email: <input type="email" name="email" require><br>
    Message: <textarea name="message"></textarea><br>
    <input type="submit" value="Envoyer">
</form>
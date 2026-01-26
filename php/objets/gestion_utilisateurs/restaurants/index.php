<?php session_start(); ?>
<!DOCTYPE html>
<html lang="fr-FR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/login.css">
    <title>Login</title>
</head>
<body>
    <div class="wrapper">
    <?php if(isset($_SESSION['message'])): ?>
                <div class="alert alert-<?php echo $_SESSION['message']['alert'] ?> msg"><?php echo $_SESSION['message']['text'] ?></div>
            <script>
                (function() {
                    // removing the message 3 seconds after the page load
                    setTimeout(function(){
                        document.querySelector('.msg').remove();
                    },3000)
                })();
            </script>
            <?php 
                endif;
                // clearing the message
                unset($_SESSION['message']);
            ?>
        <form action="./dao/login_query.php" method="post">
            <h1>Login</h1>
            <div class="input-box">
                <div class="input-field">
                <input type="text" placeholder="Nom d'utilisateur (admin)" name="username" value="admin" required>
                <i class='bx bxs-user'></i>
                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                <input type="password" placeholder="Mot de passe (monpass)" name="password" value="monpass" required>  
                <i class='bx bxs-lock-alt' ></i> 
                </div> 
            </div>
            <button type="submit" class="btn" name="login">Login</button>
            <div class="bottom">
                <span>Pas de compte ? </span><a href="registration.php" class="btn-l">Enregistrez-vous</a>
            </div>
        </form>
    </div>  
</body>
</html>
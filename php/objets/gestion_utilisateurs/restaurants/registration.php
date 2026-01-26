<!DOCTYPE html>
<html lang="fr-FR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enregistrement</title>
    <link rel="stylesheet" href="./css/login.css">
</head>
<body>
    <div class="wrapper">
        <form action="./dao/register_query.php" method="POST">
            <h1>Registration</h1>
            <div class="input-box">
                <div class="input-field">
                    <input type="text" placeholder="Nom d'utilisateur" required name="username">
                    <i class='bx bxs-user'></i>
                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                    <input type="password" placeholder="Mot de passe" name="password" required>
                    <i class='bx bxs-lock-alt'></i>
                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                    <input type="password" placeholder="Confirmer Mot de passe" name="confirmPassword" required>
                    <i class='bx bxs-lock-alt'></i>
                </div>
            </div>
            <button type="submit" class="btn" name="register">S'enregistrer</button><br>
            <div class="bottom">
                <span>Vous avez un compte ? </span><a href="index.php" class="btn-l">Login</a>
            </div>
        </form>
    </div>
</body>
</html>

<form method="post" action="index.php?page=login">
    <h1>Login</h1>
    <div class="input-box">
        <div class="input-field">
        <input type="text" placeholder="Nom d'utilisateur (admin@test.fr)" name="username"  required>
        <i class='bx bxs-user'></i>
        </div>
    </div>
    <!-- value="zarb@test.fr" value="1234" -->
    <div class="input-box">
        <div class="input-field">
        <input type="password" placeholder="Mot de passe (monpass)" name="password" >  
        <i class='bx bxs-lock-alt' ></i> 
        </div> 
    </div>
    <br>
    <button type="submit" class="btn">Se connecter</button>
    <br>


    <?php
        if (!empty($errors)) {
            echo "<div id='error'>";
            foreach ($errors as $value) {
                echo "<p>" . htmlspecialchars($value) . "</p>";
            }
            echo "</div>";
        }
    ?>
    <?php
    /* affiche dans html pour les essais
        <!-- <div id='error'><p>Nombre de tentatives de connexion: <?php echo $_SESSION['tentative_login']; ?> sur <?php echo $maxAttempts; ?>.</p></div> -->
    <br>
    /*
    if ($_SESSION['show_alert']): ?>
        <script>
            alert('Trop de tentatives. Réessayez plus tard.');
        </script>
        <?php $_SESSION['show_alert'] = false; // Reset flag after displaying ?>
    <?php endif; 
    */?>
    
</form>
<?php session_start(); ?>
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
        <form action="./controllers/CtrlLogin.php" method="post">
            <h1>Login</h1>
            <div class="input-box">
                <div class="input-field">
                <input type="text" placeholder="Nom d'utilisateur (admin)" name="username" value="zarb@test.fr" required>
                <i class='bx bxs-user'></i>
                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                <input type="password" placeholder="Mot de passe (monpass)" name="password" value="1234" required>  
                <i class='bx bxs-lock-alt' ></i> 
                </div> 
            </div>
            <br>
            <button type="submit" class="btn" name="login">Login</button>
        </form>
    </div>  
</body>
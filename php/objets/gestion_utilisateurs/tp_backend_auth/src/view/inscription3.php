  <input type="button" value="Liste des candidats" id="btnmenu">
 <form action="./index.php?page=inscription" method="post">
        <label for="username">Nom candidat:</label>
        <input type="text" id="username" name="username" required>
        <br>
        <label for="firstname">Prénom candidat:</label>
        <input type="text" id="firstname" name="firstname" required>
        <br>
        <label for="email">Email candidat:</label>
        <input type="email" id="email" name="email" required>
        <br>
        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" required>
        <br>
        <label for="confirmPassword">confirmation du mot de passe</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>
        <br>
        <select name="department" id="department">
            <?php
            use src\dao\DepartmentRepository;
            $objDept= new DepartmentRepository();
            $tabData= $objDept->searchAll();
            for($i=0; $i<count($tabData); $i++){
                echo "<option value='".$tabData[$i]["id_dep"]."' >".$tabData[$i]["Name"]."</option>";
            };
            ?>
        </select>
        <br>
        <label for="age">Votre age:</label>
        <input type="number" id="age" name="age" step="1" min="18" max="120" required>
        <br>
        <div id="summary">* Vous devez avoir plus de 18 ans pour participer au jeu-concours</div>
       
        <button type="submit" name='register'>Register</button>
    </form>

<script>
    const monbtn= document.querySelector("#btnmenu");
    monbtn.addEventListener("click", function(){
    window.location.href='http://localhost/objets/gestion_utilisateurs/tp_backend_auth/index.php?page=home';
    });
</script>


<form action="./index.php?page=inscription" method="post">
    <label for="lastname">Nom candidat:</label>
    <input type="text" id="lastname" name="lastname" value="<?php echo isset($lastname) ? htmlspecialchars($lastname) : ''; ?>" required>
    <br>
    <label for="firstname">Prénom candidat:</label>
    <input type="text" id="firstname" name="firstname" value="<?php echo isset($firstname) ? htmlspecialchars($firstname) : ''; ?>" required>
    <br>
    <label for="email">Email candidat:</label>
    <input type="email" id="email" name="email" value="<?php echo isset($email) ? htmlspecialchars($email) : ''; ?>" required>
    <br>
    <label for="password">Mot de passe:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <label for="confirmPassword">Confirmation du mot de passe:</label>
    <input type="password" id="confirmPassword" name="confirmPassword" required>
    <br>
    <select name="department" id="department">
        <?php
        if (is_array($tabData) && !empty($tabData)) {
            foreach ($tabData as $department) {
                // Check selected department
                $selected = (isset($departmentSelected) && $departmentSelected == $department["id_dep"]) ? 'selected' : '';
                echo "<option value='" . htmlspecialchars($department["id_dep"]) . "' $selected>" . htmlspecialchars($department["Name"]) . "</option>";
            }
        } else {
            echo "<option value=''>Aucun département disponible</option>";
        }
        ?>
    </select>
    <br>
    <label for="age">Votre âge:</label>
    <input type="number" id="age" name="age" step="1" min="18" max="120" value="<?php echo isset($age) ? htmlspecialchars($age) : ''; ?>" required>
    <br>
    <div id="summary">* Vous devez avoir plus de 18 ans pour participer au jeu-concours</div>
    
    <button type="submit" name='register'>Register</button>
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
</form>
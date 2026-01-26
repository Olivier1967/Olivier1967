<?php

echo " **************  Exercice 7.A ***********\n";
/**
 * Créez une fonction « stringLength() » qui accepte un argument de type string et retourne un booléen qui vaut true si la chaine de
 * caractères contient au moins 9 caractères et false si elle contient moins de 9 caractères.
 * @param string $mystring  mot de passe
 */
function getstringLength($mystring): bool{
    $slength = strlen($mystring);

    if ($slength >= 9){
        $result=true;
    }else{
        $result =false;
    };

    return $result;
};

$choix = readline("Entrez votre mot de passe long: MotDePasseLong : ");
if (getstringLength($choix) == true)
{
    echo "true";

}else {
    echo "false";
};

echo "\n";

/*
echo"la variable MDPL = ".getstringLength("MotDePasseLong").PHP_EOL;
echo"la variable azer = ".getstringLength ("azer").PHP_EOL;
echo "\n";
*/

echo " **************  Exercice 7.B ***********\n";
/**
 * Créez une fonction de vérification « passwordCheck() » acceptant un argument de type string.
 * Cette fonction retourne un booléen qui vaut true si le mot de passe respecte les règles suivantes :
 * @param string  $mypass mot de passe utilisateur */

function passwordCheck($mypass):bool{
    
    $pattern = '/^(?=.*[a-z])(?=.*[A-Z])(?=.*[\d])(?=.*[^\w\s]).*$/';
    /*
    ^: Asserts the start of the string.
    (?=.*[a-z]): Asserts that there is at least one lowercase letter.
    (?=.*[A-Z]): Asserts that there is at least one uppercase letter.
    (?=.*[\d]): Asserts that there is at least one digit.
    (?=.*[^\w\s]): Asserts that there is at least one special character (not a word character and not a whitespace).
    .*$: Matches the entire string.
    */

    $llen = getstringLength($mypass); // || $llen

    if ($llen && preg_match($pattern, $mypass)){    
         return true;
    } else {
        return false;
    };
    /*
        if (preg_match($pattern, $mypass)){
        return true;
        }else {
        return false;
        };

        autre maniere de faire :
        $uppercase = preg_match('@[A-Z]@', $password);
        $lowercase = preg_match('@[a-z]@', $password);
        $number    = preg_match('@[0-9]@', $password);
        $specialChars = preg_match('@[^\w]@', $password);

        if(!$uppercase || !$lowercase || !$number || strlen($password) < 8) {
        // tell the user something went wrong  }
    */

};

echo "\n";
$choix = readline("Entrez votre mot de passe (correcte=1Formatik@) : ");

if (passwordCheck($choix) == !true)
{
echo "Format non correct";
}else {
    echo "Format correct";
};

echo "\n";

echo " **************  Exercice 7.C ***********\n";
/**
 * Vous devez créer une fonction pour permettre l'identification d'un utilisateur.
 * Pour cet exercice, les mots de passe ne sont pas chiffrés.
 * @param string  $userName nom, $userPassword mot de passe, $users tableau d'utilisateurs
 */

// Soit le tableau d'utilisateurs suivant (récupéré depuis une base de données) :
$users = [
'joe' => 'Azer1234!',
'jack' => 'Azer-4321',
'admin' => '1234_Azer',
];

function userLogin(string $userName, string $userPassword, array $users ): bool{
   
    return isset($users[$userName]) && $users[$userName] === $userPassword;

};

echo "\n";
$choixUser = readline("Entrez votre identifiant (correcte=joe) : ");
$choixPass = readline("Entrez votre mot de passe (correcte=Azer1234!) : ");

if (userLogin($choixUser, $choixPass, $users)) {
    echo "Utilisateur et mot de passe valides.";
} else {
    echo "Utilisateur ou mot de passe invalides.";
};

echo "\n";
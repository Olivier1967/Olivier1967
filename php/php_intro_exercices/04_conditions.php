<?php

echo "Exercice 4.A:\n";
/**
 *Créer une fonction « isMajor() » acceptant un argument de type int. Elle devra retourner un booléen.
 * Si l’âge est supérieur ou égal à 18, elle doit retourner true. Sinon elle doit retourner false.
 * @param retourne < $a false >$a true
 */
function isMajor(int $a){
    if ($a >= 18){
        $result = (bool)true;
    }else{
        $result = (bool)false;
    }

    return $result;
};
//************* */
echo "json encode = ".json_encode(isMajor(19));
echo "\n";
/************* */
echo "simple echo isMajor = ".isMajor(3);
echo "\n";
/************** */
var_export(isMajor(16));
echo "\n";
/********************* */
if (isMajor(25)){
    echo "if true";
}else {
    echo "if false";
};
echo "\n";
/******************* */
if (!isMajor(5)){
    echo "!if false";
}else {
    echo "!if true";
};
echo "\n";
/******************* */

echo "Exercice 4.B:\n";
/**
 * Créer une fonction « getRetired() » acceptant un argument de type int. Elle devra retourner un string.
 * Cette fonction permet de calculer le nombre d’années restant avant la retraite ou le nombre d’années depuis la retraite.
 * Pour cet exercice, l’âge de la retraite est fixé à 60 ans
 * @param retourne  $result moins 60 en string
 */
function getRetired(int $age){
    $retired = (int) 60;
    if ($age == $retired){
        $result="Vous êtes à la retraite cette année ";
    }elseif ($age < 0){
        $result="Vous n’êtes pas encore né ";
    }elseif($age > $retired){
        $retiredPlus = $age - $retired;
        $result = "Vous êtes à la retraite depuis ".$retiredPlus." ans";
    }else{
        $retiredMoins = $retired - $age;
        $result = "il vous reste ". $retiredMoins. " ans avant la retraite";
    }

    return $result;
};

echo "mon age 12 = ".getRetired (12);
echo "\n";
echo "mon age 60 = ".getRetired (60);
echo "\n";
echo "mon age 72 = ".getRetired (72);
echo "\n";
echo "mon age -2 = ".getRetired (-2);
echo "\n";

echo "Exercice 4.C:\n";
/**
 * Créer une fonction « getMax() » acceptant 3 arguments de type float.
 * Cette fonction doit retourner la valeur du plus grand des 3 nombres. Limitez le résultat à 3 décimales
 * Si au moins 2 des valeurs fournies sont égales la fonction retourne 0
 * @param retourne  $val le plus grd
 */
function getMax(float $val1, float $val2, float $val3){
    $result= round(max($val1, $val2, $val3), 3);
    return $result;
};

echo "Valeurs max = ".getMax(1.2544, 5.6541, 8.2435441, 0.2543);
echo "\n";

echo "Exercice 4.D:\n";
/**
 *Créez une fonction « capitalCity() » qui accepte un argument de type string (le pays dont on cherche la capitale).
 * Elle devra retourner le nom de la capitale des pays suivants :
 * Si le pays ne fait pas partie de la liste ci-dessus, la fonction retourne la valeur « Capitale inconnue ».
 * @param retourne  $result la capital de $country du pay
 */
function capitalCity(string $country){
    switch(strtolower($country)){
        case "france":
            $result = "Capital est Paris";
            break;
    
        case "allemagne":
            $result = "Capital est Berlin";
            break;

        case "italie":
            $result = "Capital est Rome";
            break;
            
        case "maroc":
            $result = "Capital est Rabat";
            break;

        case "espagne":
            $result = "Capital est Madrid";
            break;

        case "portugal":
            $result = "Capital est Lisbonne";
            break;

        case "angleterre":
            $result = "Capital est Londres";
            break;

        default:
            $result = "Capitale inconnue ";
            break;

    };

    return $result;
};

$choix = readline("Quel pays voulez vous ? : ");
echo capitalCity($choix);
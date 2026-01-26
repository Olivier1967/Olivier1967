<?php
/*
echo "1 - Addition exercice 2.A \n";
echo "2 - Soustraction exercice 2.B \n";
echo "3 - Multiplication exercice 2.C \n";
echo "4 - Division exercice 2.C \n";
$choixtest = readline('Entrez votre choix : ');

echo "Entrez vos 2 nombres \n";
$nombreA = readline('nombreA = ');
$nombreB = readline('nombreB = ');


function getNombre ($nombre1, $nombre2, int $choix){
    if ($choix == 1){
        $result= $nombre1 + $nombre2;
       $choixFait = "addition = ";
    }
    elseif ($choix == 2){
        $result= $nombre1 - $nombre2;
        $choixFait = "soustraction = ";
    }
    elseif ($choix == 3){
        $result= round(((float)$nombre1 * (float)$nombre2), 2);
        $choixFait = "multiplication = ";
    }
    else {
            if($nombre2 == 0){
                $result=0;
                }
            else
            {$result= round(($nombre1 / $nombre2), 2);
            }
            $choixFait = "division = ";
    }

    return $choixFait." ".$result;
}

echo "resultat pour une ".getNombre($nombreA , $nombreB, $choixtest).PHP_EOL;

echo"*******************************************************************";

*/
/**
 * Créer une fonction « getSum() » qui accepte deux arguments de type int. Elle devra retourner la somme des deux valeurs.
 * @param int $c, int $d , getSum($c, $d) additionne c et d
 */
/*
function getSum( $c, $d){
   
    echo "resultat de $c + $d = ";

    return $c + $d;
}

echo getSum(5, 3);
echo "\n";

echo "Exercice 2.B\n";

*/

/**
 * Créer une fonction « getSub() » qui accepte deux arguments de type int. Elle devra retourner la somme des deux valeurs.
 * @param int $c, int $d , getSub($c, $d) soustraction de c et d
 */

/*
function getSub( $a, $b){
   
    $result =  $a - $b;

    return $result;
}
$var1=5;
$var2=3;
echo "resultat de $var1 - $var2 = " . getSub($var1, $var2).PHP_EOL;
echo "resultat de $var2 - $var1 = " . getSub($var2, $var1).PHP_EOL;


echo "Exercice 2.C\n";

*/
/**
 * Créer une fonction « getMulti() » qui accepte deux arguments de type float. Elle devra retourner la somme des deux valeurs. limite 2 décimales
 * @param int $c, int $d , getSub($c, $d) soustraction de c et d
 */

/*
function getMulti( float $c, float $d){
   
    echo "resultat de $c x $d = ";

    return round(($c * $d), 2);
}

echo getMulti(5.6, 3);
echo "\n";
echo getMulti(5.6, -3.7);
echo "\n";

echo "Exercice 2.D\n";

function getDiv(int $c, int $d){
   
    echo "resultat de $c / $d = ";

    if($d == 0){
        echo "resultat de $c / $d = 0 ";
    } else {
        return round(($c / $d), 2);
    }   
}

echo getDiv(20, 3);
echo "\n";
echo getDiv(20, 0);

*/
echo "1 - Addition exercice 2.A \n";
echo "2 - Soustraction exercice 2.B \n";
echo "3 - Multiplication exercice 2.C \n";
echo "4 - Division exercice 2.C \n";
$choixtest = readline('Entrez votre choix : ');
if ($choixtest > 4)
    {echo "Pas d'opération pour ce choix ";
    exit();};

echo "Entrez vos 2 nombres \n";
$nombreA = readline('nombreA = ');
$nombreB = readline('nombreB = ');


function getNomber ($nombre1, $nombre2, int $choix){
    
    switch($choix)
    {
        case 1:
            $result= $nombre1 + $nombre2;
            $choixFait = "addition = ";
            break;

        case 2:
            $result= $nombre1 - $nombre2;
            $choixFait = "soustraction = ";
            break;

        case 3:
            $result= round(((float)$nombre1 * (float)$nombre2), 2);
            $choixFait = "multiplication = ";
            break;

        case 4:
            if($nombre2 == 0){
                $result=0;
                }
            else
            {$result= round(($nombre1 / $nombre2), 2);
            }
            $choixFait = "division = ";
            break;

        default:
            echo "Pas d'opération pour le choix " . $choix;
            break;
    }

    return $choixFait." ".$result;
}

echo "resultat pour une ".getNomber($nombreA , $nombreB, $choixtest).PHP_EOL;
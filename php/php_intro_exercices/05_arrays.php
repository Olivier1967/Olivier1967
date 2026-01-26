<?php

echo "Exercice 5.A:\n";
/**
 * Créer une fonction « firstItem() » qui accepte un argument de type array. Elle devra retourner le premier élément du tableau. Si
 * le tableau est vide, la fonction retourne null.
 * @param retourne  $result dans $names[0]
 */

$names =['Joe', 'Jack', 'Léa', 'Zoé', 'Néo'];
$names2 =[];

/* les function des array : 
print_r($names);

echo PHP_EOL;
echo "hello {$names[0]}";
echo PHP_EOL;

echo "current array = ". current($names);
echo PHP_EOL;
echo "reset array = ". reset($names);
echo PHP_EOL;
echo "key array = ". key($names);
echo PHP_EOL;
echo "empty array = ". empty($names);
echo PHP_EOL;
echo "empty array2 = ". empty($names2);
echo PHP_EOL;
// $first_value = reset($array); // First element's value
// $first_key = key($array); // First element's key
*/

function firstItem(array $array){
    if (empty($array)){
        $result = "array null";
    }else{
        $result = current($array);
    };

    return $result;
};

echo "Premier élément dans le tableau = ".firstItem($names).PHP_EOL;

echo "Exercice 5.B:\n";
/**
 * Créer une fonction « lastItem() » acceptant un argument de type array. Elle devra retourner le dernier élément du tableau. Si le
 * tableau est vide, il faudra retourner null.
 * @param retourne  $result dans $names[dernier]
 */

function lastItem(array $array){
    if (empty($array)){
        $result = "array null";
    }else{
        $result = end($array);
    };

    return $result;
};

echo "Dernier élément dans le tableau = ".lastItem($names).PHP_EOL;

echo "Exercice 5.C:\n";
/**
 * Créer une fonction « sortItems() » acceptant un argument de type array.
 * Cette fonction retourne le tableau trié par ordre décroissant. Si le tableau est vide, il faudra retourner un tableau vide.
 * @param retourne  $result dans $names trier par ordre descroissant
 */

function sortItem(array $array){
    if (empty($array)){
        return "array null";
    }else{
        rsort($array);
        return $array;
    };
};

$sortedNames = sortItem($names);

echo "Lister les éléments du tableau dnas l'ordre decroissant (.implode) = ".implode(" ", $sortedNames);
echo "\n";

function sortItem2(array $array){
    if (empty($array)){
        return "array null";
    }else{
        rsort($array);
        $result = "Lister les éléments du tableau dnas l'ordre decroissant (foreach) = ";

        foreach($array as $item){
            $result .="\n$item"; 
        }
        return $result;
    };
};

echo sortItem2($names);
echo "\n";
echo "\n";

echo "Exercice 5.D:\n";
/**
 * Créer une fonction « sortItems() » acceptant un argument de type array.
 * Cette fonction retourne le tableau trié par ordre décroissant. Si le tableau est vide, il faudra retourner un tableau vide.
 * @param retourne  $result dans $names trier par ordre descroissant
 */

function stringItems(array $array){
    if (empty($array)){
        $result = "Nothing to display";
    }else{
        sort($array);
        $result= implode(", ", $array);
    };

    return $result;
};

echo "Lister les éléments du tableau dnas l'ordre croissant ".stringItems($names);
echo "\n";
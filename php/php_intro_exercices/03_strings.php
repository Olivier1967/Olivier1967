<?php
echo "Exercice 3.A:\n";
/**
 * Créer une fonction « getMC2() ». Cette fonction doit retourner Le nom de l’inventeur de la formule « E = MC² ».
 * @param retourne einstein
 */
function getMC2() {
   $mc2= "Einstein";
   return $mc2;
}

echo getMC2();
echo "\n";

echo "Exercice 3.B:\n";
/**
 * Créer une fonction « getUserName() » qui accepte deux arguments (prénom et nom) de type string. 
 * Cette fonction doit retourner la concaténation des deux valeurs.
 * @param retourne $prenom $nom
 */
function getUserName(string $prenom, string $nom){
    $result= $prenom.$nom.PHP_EOL;
    return $result;
}

echo getUserName ('mickaël', 'devoldère');

echo "Exercice 3.C:\n";
/**
 * Créer une fonction « getFullName() » acceptant deux arguments (nom et prénom) de type string.
 * Cette fonction doit retourner la concaténation des deux valeurs avec un espace entre les 2, 
 * le prénom en minuscule et le nom en MAJUSCULE.
 * @param retourne $prenom, $nom en masjuscule
 */
function getFullName(string $nom, string $prenom){
    $result= $prenom." ".strtoupper($nom); //.PHP_EOL;
    return $result;
}

echo getFullName ('devoldère', 'mickaël');
echo "\n";

echo "Exercice 3.D:\n";
/**
 * Créer une fonction « askUser() » acceptant deux arguments (nom et prénom) de type string.
 * Cette fonction doit retourner une chaîne de caractères sous la forme : 
 * @param retourne « Bonjour prénom, nom. Connaissez-vous Einstein ? »
 */
function askUser(string $nom, string $prenom){
    $result = "Bonjour ".getFullName($nom, $prenom)." connaissez-vous ".getMC2(). " ?";
    return $result;
};

echo askUser('devoldère', 'mickaël');
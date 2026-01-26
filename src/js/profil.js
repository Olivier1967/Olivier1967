//importer class de sauvegarde et restauration du fichier utilisateurs
import { JsonData } from "./fetch.js";

let utilisateurs = await JsonData.getUtilisateurs();

// obtenir les buttons
const increment = document.getElementById('increment');
const decrement = document.getElementById('decrement');
const searchButton = document.getElementById('searchvalid');
const search = document.getElementById('search');

// variable de la page profil
const fieldNumber = document.getElementById('fieldnumber');
const inputNom = document.getElementById('pfname');
const inputPrenom = document.getElementById('plname');
const inputEmail = document.getElementById('pemail');
const inputRole = document.getElementById('prole');

// icrementation element profil
let element=0;

// variable envois résultat dans une variable
const result = document.getElementById('result');

// rechercher un utilisateur
searchButton.addEventListener('click', function(event){

    event.preventDefault();

    const rsearch = search.value;

    //.. ca marche !
    // #todo: const results = jsonData.filter(item => item.nom.toLowerCase().includes(searchTerm.toLowerCase()));
    for (let i in utilisateurs){ 
            
        //if (utilisateurs[i].Nom.toLowerCase() === rsearch.toLowerCase()){
        if (utilisateurs[i].Nom.toLowerCase().includes(rsearch.toLowerCase())){
           console.log("nom du for in = "+rsearch+" utilisateur = "+utilisateurs[i].Nom);
            element = i;
            console.log('objectkeys de element = '+element);

            rempliChamp();
        }
        
    };
    console.log("--------------------------------------");

    //utilisation de .filter pour le resultat et transformer en string
    const results = utilisateurs.filter(item => item.Nom.toLowerCase().includes(rsearch.toLowerCase()));
    console.log("filterText(utilisateurs, rsearch) = ", results);
    console.log("filterText(utilisateurs, rsearch) = " + JSON.stringify(results, null, 2));

    results.forEach(item => {
    console.log(`nom = "${rsearch}"  →  résultat = "${item.Nom}"`);
    console.log("Object.key = "+Object.keys(item.Nom));
    console.log("--------------------------------------");


    });
 

    // a ajouter .starwith .tolowercase
 
    utilisateurs.forEach(function (item) {
        if (item.Nom.toLowerCase() === rsearch.toLowerCase()) {
           console.log("trouvé for each = ", item);}
    });
    console.log("--------------------------------------");

    });


// click sur increment
increment.addEventListener('click', function(event){
        
    event.preventDefault();

    rempliChamp();

    let last = Object.keys(utilisateurs)[Object.keys(utilisateurs).length -1];

    // incrementation du tableau !!
    element++;

    if(element > last){
        fieldNumber.innerHTML = "dernier élément";
        element=last;}
});

// click sur decrement
decrement.addEventListener('click', function(event){

    event.preventDefault();
    
    rempliChamp();

    // decrementation du tableau !!
    element--;

    if(element < 0){
        fieldNumber.innerHTML = "début de liste";
        element=0;
    }
});

function rempliChamp(){

    fieldNumber.innerHTML = element;
    inputNom.value = utilisateurs[element].Nom;
    inputPrenom.value = utilisateurs[element].Prenom;
    inputEmail.value = utilisateurs[element].Email;
    inputRole.value = utilisateurs[element].Role;

}

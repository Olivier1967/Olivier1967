//importer class validation
//import { Validation } from "./Validation.js";

//importer class de sauvegarde et restauration du fichier utilisateurs
import { JsonData, JsonSave } from "./fetch.js";

let utilisateurs = await JsonData.getUtilisateurs();

// variable d'ajout role et sa description
const addUtils = document.getElementById('addutils');
const inputNom = document.getElementById('ufname');   
const inputNomError = document.getElementById('ufname-error');
const inputPrenom = document.getElementById('ulname');
const inputEmail = document.getElementById('uemail');
const inputRole = document.getElementById('urole');

// variable envois résultat dans une variable
const result = document.getElementById('result');


addUtils.addEventListener('submit',function (event){

    event.preventDefault();

    let champNom = inputNom.value.trim();
    let champPrenom = inputPrenom.value.trim();
    let champEmail = inputEmail.value.trim();
    let champRole = inputRole.value.trim();

    //verification des champs
    /*
    try{
        estValide(champNom);
    }catch(error){
        throw error;
    }
        */

    const isNameValid = validateName(champNom);
    const isPrenomValid = validateName(champPrenom);
    const isEmailValid = validateEmail(champEmail);

    if(!isNameValid) {
        inputNomError.textContent = "Le nom est invalide" ;
    }else{
        inputNomError.textContent = '';
    };

    if(isNameValid && isPrenomValid && isEmailValid) {
        
        let addUtiltemp = { Nom: champNom, Prenom: champPrenom, Email: champEmail, Role: champRole };
    
        // savegarde dans localstorage
        JsonSave.saveUtilisateurs(addUtiltemp);
        
        // Ajoute l'objet au tableau 'data'
        utilisateurs.push(addUtiltemp);

        let last = Object.keys(utilisateurs)[Object.keys(utilisateurs).length - 1];
        console.log("last=",last);

        result.insertAdjacentHTML( 'beforeend',"<li> Nom : " + utilisateurs[last].Nom + " </li>");
        result.insertAdjacentHTML( 'beforeend',"<li> Prénom : " + utilisateurs[last].Prenom + " </li>");
        result.insertAdjacentHTML( 'beforeend',"<li> Email : " + utilisateurs[last].Email + " </li>");
        result.insertAdjacentHTML( 'beforeend',"<li> Role : " + utilisateurs[last].Role + " </li>");

        alert('données enregistrés !');
    } else {

    }

});

function estValide(){
    let validation = new Validation();
    validation.validerFormatNombre(nom);
}

function validateName(_name){
    let regexName = /^[A-Za-z]{3,}$/;
    return regexName.test(_name);
}

function validateEmail(_email){
    let regexEmail = /^[\w\.-]+@[\w]+\.[a-z]+$/;
    return regexEmail.test(_email);
}

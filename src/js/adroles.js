import { JsonData, JsonSave } from "./fetch.js";

let roles = await JsonData.getRoles();

//variable du sumit form
const form = document.getElementById('formut');
const result = document.getElementById('result');
const afficherListe = document.getElementById('afficherliste');

// variable d'ajout role et sa description
const nrole = document.getElementById('nrole');
const descrip = document.getElementById('descrip');

form.addEventListener('submit', function(event){
     
    event.preventDefault();

         // récupérer la valeur du champ input
    let newRoleValue = nrole.value.trim();
    let newDescripValue = descrip.value.trim();

    if (newRoleValue && newDescripValue) {
        let roletemp = { Role: newRoleValue, Description: newDescripValue };
        JsonSave.saveRole(roletemp);
        roles.push(roletemp);
        // Affiche temporairement le nouvel utilisateur avec rôle et description
        result.insertAdjacentHTML('beforeend', `<li>Role: ${newRoleValue}, Description: ${newDescripValue}</li>`);
        // Réinitialise les champs de saisie
        nrole.value = '';
        descrip.value = '';
    } else {
        alert("Veuillez remplir le rôle et la description.");
    } 
    
});

afficherListe.addEventListener('click', function(event){
    event.preventDefault();

    window.location.replace("roles.html");
});

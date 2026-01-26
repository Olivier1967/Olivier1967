import { JsonData } from "./fetch.js";

const tableUtBody = document.querySelector("#tableUtBody tbody");

let utilisateurs = await JsonData.getUtilisateurs();

/* lancement des fonction de JS */
tableauUtilisateurs();

/* toutes les fonctions du JS */
function tableauUtilisateurs(){

        utilisateurs.forEach(util => {
        const row=document.createElement('tr');

        const nomCell=document.createElement('td');
        nomCell.textContent= util.Nom;
        row.appendChild(nomCell);

        const prenomCell=document.createElement('td');
        prenomCell.textContent= util.Prenom;
        row.appendChild(prenomCell);

        const emailCell=document.createElement('td');
        emailCell.textContent= util.Email;
        row.appendChild(emailCell);

        const roleCell=document.createElement('td');
        roleCell.textContent= util.Role;
        row.appendChild(roleCell);

        tableUtBody.appendChild(row);
        });
    
}
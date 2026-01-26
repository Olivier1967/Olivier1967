import { JsonData } from "./fetch.js";

/* variable tableau classique avec json */
const tableBody = document.querySelector("#tablejson #tbody");
const myTable = document.getElementById('mytable');
const effacerListe = document.getElementById('effacerliste');

// table json dans fichier js 
//let rep = await fetch('./data/role.json');
//let jsonData = await rep.json();

let jsonData = await JsonData.getRoles();

tableJson(); // utilisation tableau Json

// créate table classique
function tableJson() {

    myTable.innerHTML = "";

    let headers = ["Role", "Description", "Supprimer"];
    let table = document.createElement("table");
        
    for(let i = 0; i < jsonData.length; i++) {

        let row = table.insertRow(i);
        let btn = document.createElement("button");

        btn.textContent = "X";
        btn.type = "button";
        btn.id = "btnsup";
        btn.dataset.position = i;
        btn.addEventListener("click", deleteTab);

        row.insertCell(0).innerHTML = jsonData[i].Role; //row.insertCell(0).innerHTML = jsonData[i].split(" ")[0];
        row.insertCell(1).innerHTML = jsonData[i].Description;
        row.insertCell(2).append(btn);

      }

    let header = table.createTHead();
    let headerRow = header.insertRow(0);
    for(let i = 0; i < headers.length; i++) {
        headerRow.insertCell(i).innerHTML = headers[i];
    }

    myTable.appendChild(table);
}

/* créate tableauJson */
/*
function tableJson(){

    jsonData.forEach(([utrole, value]) => {
    const row=document.createElement('tr');

    console.log('value = '+value);
    const roleCell=document.createElement('td');
    roleCell.textContent= utrole.Role;
    row.appendChild(roleCell);

    const descripCell=document.createElement('td');
    descripCell.textContent= utrole.Description; //.join(", ");
    row.appendChild(descripCell);

    tableBody.appendChild(row);
    });

}
*/

effacerListe.addEventListener('click', function(event){
    
    event.preventDefault();

    localStorage.clear();
    window.location.reload();
});

function deleteTab(event){
  let btn = event.target; // récupérer le bouton qui a déclenché l'évènement
  let position = btn.dataset.position;
  jsonData.splice(position, 1); // supprimer un élément à partir de sa position. (voir aussi filter())
  tableJson();
}

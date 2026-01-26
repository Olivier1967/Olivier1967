

/* function from Franck
function afficherCarte(tabcartes) {
  const myTable = document.querySelector("#jeu");
  const mythead = myTable.createTHead();
  const myTitleRow = mythead.insertRow();

  for (var key in tabcartes[0]) {
    insertTitleCell(myTitleRow, key);
  }

  const myTbody = myTable.createTBody();
  const headers = Object.keys(tabcartes[0]);

  for (let i = 0; i < tabcartes.length; i++) {
    const myCurrentRow = myTbody.insertRow();
    if (i == 0) {
      for (const key in tabcartes[i]) {
        const currentCell = myCurrentRow.insertCell();
        currentCell.textContent = tabcartes[i][key];
      }
    } else {
      for (let j = 0; j < headers.length; j++) {
        const currentCell = myCurrentRow.insertCell();
        currentCell.textContent = tabcartes[i][headers[j]];
      }
    }
  }
}

/* from Franck optimisé*/
function afficherCarte(tabcartes) {
    const myTable = document.querySelector("#jeu");
    const myThead = myTable.createTHead();

    // Create the title row
    const myTitleRow = myThead.insertRow();
    const headers = Object.keys(tabcartes[0]); // Get keys from the first object
    const titleLength = headers.length; // Dynamic length from the first row

    // Insert header cells for the title row
    for (let i = 0; i < titleLength; i++) {
        insertTitleCell(myTitleRow, headers[i]);
    }

    // Create the table body
    const myTbody = myTable.createTBody();
    for (let i = 0; i < tabcartes.length; i++) {
        const myCurrentRow = myTbody.insertRow();

        for (let j = 0; j < titleLength; j++) {
            const currentCell = myCurrentRow.insertCell();
            currentCell.textContent = tabcartes[i][headers[j]];
        }
    }
}

/*
function insertTitleCell(row, value) {
  const myCell = document.createElement("th");
  myCell.textContent = value;
  //myCell.setAttribute("class", "titre");
  row.appendChild(myCell);
}


function afficherCarte(tabcartes) {
    const myTable = document.querySelector("#jeu");
    const myThead = myTable.createTHead();

    // Determine all possible headers
    const headers = new Set(); // Use a Set to avoid duplicates
    tabcartes.forEach(card => {
        Object.keys(card).forEach(key => headers.add(key));
    });

    const myTitleRow = myThead.insertRow();
    headers.forEach(header => insertTitleCell(myTitleRow, header)); // Add headers to the title row

    const myTbody = myTable.createTBody();
    tabcartes.forEach(card => {
        const myCurrentRow = myTbody.insertRow();
        headers.forEach(header => {
            const currentCell = myCurrentRow.insertCell();
            currentCell.textContent = card[header] !== undefined ? card[header] : ""; // Fill empty if not defined
        });
    });
}
*/

function rechercheMaxParties(tabcartes){
  let max = tabcartes[0].played;
  let indiceCarteMax = 0;
  for (let index = 1; index < tabcartes.length; index++) {
    if(tabcartes[index].played>max){
      max=tabcartes[index].played;
      indiceCarteMax = index;
    }
    
  }
  
  document.querySelector("#max").innerText="le joueur qui a le plus de partie est : " + tabcartes[indiceCarteMax].name + " son nombre de victoire est : " + tabcartes[indiceCarteMax].victory + " sur " + tabcartes[indiceCarteMax].played + " parties joués !";

}


/*
fetch("https://trefle.io/api/v1/plants?token=usr-BAk8OEvy1-1-Sy9O-_ZrbWSKkhwBnoeIMceWpuE3A0Y")
  .then((response) => response.json())
  .then((response) => {
    console.log(response);
    afficherCarte(response);
  });
  */

//fetch("https://arfp.github.io/tp/web/javascript/03-cardgame/cardgame.json")

fetch("../js_carte/plants.json")
  .then((response) => response.json())
  .then((response) => {
    console.log(response);
    afficherCarte(response);
    //rechercheMaxParties(response);
  });


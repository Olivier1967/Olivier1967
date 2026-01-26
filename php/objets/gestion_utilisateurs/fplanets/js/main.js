
function afficherPlanets(planet) {
    const myTable = document.querySelector("#planets");
    const myThead = myTable.createTHead();

    // Determine all possible headers
    const headers = new Set(); // Use a Set to avoid duplicates
    planet.forEach(items => {
        Object.keys(items).forEach(key => headers.add(key));
    });

    const myTitleRow = myThead.insertRow();
    headers.forEach(header => insertTitleCell(myTitleRow, header)); // Add headers to the title row

    const myTbody = myTable.createTBody();
    planet.forEach(items => {
        const myCurrentRow = myTbody.insertRow();
        headers.forEach(header => {
            const currentCell = myCurrentRow.insertCell();
            currentCell.textContent = items[header] !== undefined ? items[header] : ""; // Fill empty if not defined
        });
    });
}

function insertTitleCell(row, value) {
  const myCell = document.createElement("th");
  myCell.textContent = value;
  row.appendChild(myCell);
}



const apiUrl = "https://api.le-systeme-solaire.net/rest/bodies/terre";
const token = "xxx-xxx-xxx"; // Replace this with your actual token

fetch(apiUrl, {
    method: "GET",  // Specify the method if necessary
    headers: {
        "Authorization": `Bearer ${token}`, // Include the token in the Authorization header
        "Content-Type": "application/json" // Optional: Set the content type
    }
})
.then((response) => {
    if (!response.ok) { // Check if response is not OK
        throw new Error('Network response was not ok ' + response.statusText);
    }
    return response.json();
})
.then((data) => {
    console.log(data); // Log the response data
    afficherPlanets(data); // Call your function to display planets
})
.catch((error) => {
    console.error('There was a problem with the fetch operation:', error); // Handle any errors
});


//fetch("../js_carte/plants.json")
/*
fetch("https://arfp.github.io/tp/web/javascript/03-cardgame/cardgame.json")
  .then((response) => response.json())
  .then((response) => {
    console.log(response);
    afficherPlanets(response);
  });
  */
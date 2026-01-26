
fetch("../js_carte/plants.json")
    .then((response) => {
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
    })
    .then((data) => {
        console.log(data); // Log the fetched data
        afficherCarte(data); // Call the display function
    })
    .catch((error) => {
        console.error('Error fetching data:', error);
    });

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

// Function to display the plants
function displayPlants(response) {
    const container = document.getElementById('plants-container');

    // Access the array of plants
    const plants = response.data;

    // Ensure plants is an array and not empty
    if (!Array.isArray(plants) || plants.length === 0) {
        container.innerHTML = "No plants available.";
        return; // Exit if no valid plants are available
    }

    // Clear the container before displaying new data
    container.innerHTML = "";

    // Create a link for each plant
    plants.forEach(plant => {
        const plantLink = document.createElement('a');
        plantLink.href = `plants/${plant.id}.html`; // Adjust as necessary
        plantLink.textContent = plant.name; // Use the plant's name
        plantLink.target = "_blank"; // Open in new tab
        container.appendChild(plantLink);
        container.appendChild(document.createElement('br')); // Line break
    });
}
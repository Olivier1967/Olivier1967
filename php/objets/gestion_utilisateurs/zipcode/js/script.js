fetch("https://arfp.github.io/tp/web/javascript/02-zipcodes/zipcodes.json")
.then(response=>response.json())
.then((data)=>{
    console.log(data);
    fillList(data);
})
.catch(console.error());

let tabdata=[];

function fillList(_tabdata){
    tabdata=_tabdata;
    
    for (let i = 0; i < tabdata.length; i++) {
        const myoption = document.createElement("option");
        myoption.value=tabdata[i].codePostal;
        myoption.textContent=tabdata[i].codePostal + "-" + tabdata[i].nomCommune;
        document.querySelector("#cp").appendChild(myoption);
        
    }
}

const btnRecherche= document.getElementById("listcity");
btnRecherche.addEventListener("click", function(){
    $objCommune=tabdata.filter(obj=>obj.codePostal==document.querySelector("#zipcode").value);
    const myitem = document.createElement("li");
    myitem.textContent=$objCommune.nomCommune;
    document.querySelector("#listcity").appendChild(myitem);

})
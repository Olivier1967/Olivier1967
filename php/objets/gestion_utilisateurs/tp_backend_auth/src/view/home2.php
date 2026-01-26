<?php
//controleur pricipale
use src\dao\CandidateRepository;

$objCandidat = new CandidateRepository();

?>

<body>
  <h1>Liste des candidats inscrits à la foire aux vins Colmar</h1><br>

  <input type="button" value="Enregistrer un candidat" id="btnFormu">

    <form method="POST" action="./dao/export.php">
        <input type="submit" name="export" value="Exporter en JSON"></input>
    </form>
  
  <!--   <input type="button" value="Exporter en JSON" id="btnExport"> -->

  <?php

  function afficherTableau(array $data): string
  {

    $chainesHtml = "<table class='styled-table' ><thead><tr>";
    foreach (array_keys($data[0]) as $colonne) {
      if ($colonne != "id_user" && $colonne != "pass_user" && $colonne != "archive_user") {
        $chainesHtml .= "<th>" . htmlspecialchars($colonne) . "</th>";
      };
    }
    $chainesHtml .= "</tr></thead><tbody>";
    foreach ($data as $ligne) {
      $chainesHtml .= "<tr>";
      foreach ($ligne as $key => $value) {
        if ($key != "id_user" && $key != "pass_user" && $key != "archive_user") {
          $chainesHtml .= "<td>" . htmlspecialchars($value) . "</td>";
        };
      }
      $chainesHtml .= "</tr>";
    }
    $chainesHtml .= "</tbody></table>";
    return $chainesHtml;
  }


  $chaine = afficherTableau($objCandidat->searchAll());

  echo $chaine;
  ?>


  <script>
    const monbtn = document.querySelector("#btnFormu");
    monbtn.addEventListener("click", function() {
      window.location.href = 'http://localhost/objets/gestion_utilisateurs/tp_backend_auth/index.php?page=inscription';});
    
    /*
    const btnExport = document.querySelector("#btnExport");
    btnExport.addEventListener("click", function() {
        fetch('export.php')
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert("-- Exporté avec succès ! --");
                } else {
                    alert("L'export a échoué: " + data.error);
                }
            })
            .catch((error) => {
                console.error('Erreur:', error);
                alert("Une erreur est survenue lors de l'export.");
            });
    });
    */
  </script>
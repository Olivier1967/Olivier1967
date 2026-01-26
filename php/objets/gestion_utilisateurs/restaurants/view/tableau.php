<?php
function afficherTableau(array $data): string
{
    $chainesHtml = "<table class='styled-table'><thead><tr>";
    
    // table headers
    foreach (array_keys($data[0]) as $colonne) {
        $chainesHtml .= "<th>" . htmlspecialchars($colonne) . "</th>";
        
    }
    
    $chainesHtml .= "<th>Modifier</th><th>Supprimer</th>";
    
    $chainesHtml .= "</tr></thead><tbody>";
    
    foreach ($data as $ligne) {
        $chainesHtml .= "<tr>";
        
        foreach ($ligne as $cellule) {
            $chainesHtml .= "<td>" .htmlspecialchars($cellule)  . "</td>";
        }

        if (isset($ligne['id'])) {
            $id = htmlspecialchars($ligne['id']); 
            $chainesHtml .= "<td><a href='./dao/modifier.php?id=$id' class='button-link'>Modifier</a></td>";
            $chainesHtml .= "<td><a href='./dao/supprimer.php?id=$id' class='button-link' onclick='return confirm(\"Êtes-vous sûr de vouloir supprimer ?\");'>Supprimer</a></td>";
        } else {
            $chainesHtml .= "<td>N/A</td><td>N/A</td>";
        }

        $chainesHtml .= "</tr>";
    }
    
    $chainesHtml .= "</tbody></table>";
    return $chainesHtml;
}
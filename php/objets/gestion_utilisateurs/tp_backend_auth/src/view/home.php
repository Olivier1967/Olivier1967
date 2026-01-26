 <?php

    function displayData(array $data): string
    {

        $chainesHtml = "<table class='styled-table' ><thead><tr>";
        foreach (array_keys($data[0]) as $colonne) {

            $chainesHtml .= "<th>" . htmlspecialchars($colonne) . "</th>";
        }
        $chainesHtml .= "</tr></thead><tbody>";
        foreach ($data as $ligne) {
            $chainesHtml .= "<tr>";
            foreach ($ligne as $key => $value) {

                $chainesHtml .= "<td>" . htmlspecialchars($value) . "</td>";
            }
            $chainesHtml .= "</tr>";
        }
        $chainesHtml .= "</tbody></table>";
        return $chainesHtml;
    }

    echo displayData($dataCandidat);
?>
    <form method="POST" action="./src/controllers/export.php">
        <input type="submit" name="export" value="Exporter en JSON"></input>
        <?php
        // regarde si il y a un msg a afficher
        if (isset($_SESSION['msg'])) {
            echo '<p id="message">' . htmlspecialchars($_SESSION['msg']) . '</p>';
            unset($_SESSION['msg']);
        ?>
        <script>
        // Efface le msg après 2 secondes
        setTimeout(function() {
            document.getElementById('message').style.display = 'none';
        }, 2000);
        </script>
        <?php
        }
        ?>
    </form>


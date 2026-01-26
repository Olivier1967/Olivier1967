<?php

/*
echo date("l");
echo "\n";
echo date('l jS \of F Y h:i:s A');
echo "\n";
echo date('l j F Y');
echo "\n";

*/
echo "\n";
echo " En Français en chiffre -----------: \n";
$date = DateTimeImmutable::createFromFormat('U', time());
echo $date->format('d-m-Y');
echo "\n";

echo " En Français avec jours -----------: \n";

// Set the locale to French
$locale = 'fr_FR';

// Create a DateTimeImmutable object for October 10, 2025
$date2 = new DateTimeImmutable();

// Create an IntlDateFormatter
$formatter = new IntlDateFormatter(
    $locale,
    IntlDateFormatter::FULL,
    IntlDateFormatter::NONE,
    null,
    IntlDateFormatter::GREGORIAN,
    'EEEE dd MMMM yyyy' // Pattern for formatting
);

// Format the date
$formattedDate = $formatter->format($date2);

// Output the result
echo $formattedDate; // Output: vendredi 10 octobre 2025
echo "\n";
echo " **************  Exercice 6.A ***********";
/**
 * Créer une fonction « getToday() ». Cette fonction doit afficher et retourner la date du jour au format d/m/Y sous forme de
 * chaine de caractères (exemple : 21/10/2020).
 * @param retourne  $date d'aujourd'hui
 */
echo "\n";
function getToday(){
    $date = DateTimeImmutable::createFromFormat('U', time());
    return $date->format('d-m-Y');
};

echo "date d'aujourd'hui : ".getToday().PHP_EOL;

echo " **************  Exercice 6.B ***********\n";
/**
 * Créer une fonction « getToday() ». Cette fonction doit afficher et retourner la date du jour au format d/m/Y sous forme de
 * chaine de caractères (exemple : 21/10/2020).
 * @param retourne  $result par rapport aux date enntee _ d'aujourd'hui _et demain
 */

//$mydate="2025-14-01";
//$dt = strtotime($mydate);
//echo "transformation $mydate au format date $dt ".date("Y-m-d", $dt).PHP_EOL;

function validateDate($date, $format = 'Y-m-d')
{
    $d1 = DateTime::createFromFormat($format, $date);
    return $d1 && $d1->format($format) == $date;
}

// echo "validation date = ".validateDate($mydate);


function getTimeLeft($mydate): string{
    $d = strtotime($mydate);
    $val = validateDate($mydate);
    $todaydate = strtotime(date("Y-m-d"));

    if ($val){
        
        if ($d < $todaydate){
            $result= " Évènement passé ";
        }elseif($d === $todaydate){
            $result= " Aujourd'hui ";
        }else{
            $datenow = new DateTime();
            $target = new DateTime($mydate);
            $target->add(new DateInterval('P1D'));
            $interval = date_diff($datenow, $target);

            // selectionner l'interval 
            $Month = $interval->m;
            $Years = $interval->y;

          if ($Years > 0) {
                //$result = "Difference: " . $fullYearsDifference . " ans, " . $fullMonthsDifference . " mois, et " . $daysIncludingTargetDate . " jours";
                $result = printf("%d ans, %d mois, %d jours", $interval->y, $interval->m, $interval->d);
            } elseif ($Month > 0) {
                //$result = "Difference: " . $fullMonthsDifference . " mois, et " . $daysIncludingTargetDate . " jours";
                $result = printf("%d mois, %d jours", $interval->m, $interval->d);
            } else {
               //$result = "Difference: " . $daysIncludingTargetDate . " jours";
               $result = printf("%d jours", $interval->d);
            };

            //$result = $interval->format('%R%a days');

            //$result = printf("%d ans, %d mois, %d jours", $interval->y, $interval->m, $interval->d);

        };


    } else {
        $result = "Ce n'est pas un bon format date !";
    };

    return $result;
};


echo "avec la date 2019-09-29 = ".getTimeLeft("2019-09-29");
echo "\n";

echo "avec la date aujourd'hui = ".getTimeLeft("2025-10-30");
echo "\n";

echo "fausse date = ".getTimeLeft("2025-14-29");
echo "\n";

echo "Ecart avec date du ".date('Y-m-d')." et la date du 2025-11-07 = ";
echo "\n";
getTimeLeft("2025-11-07");
echo "\n";

echo "Ecart avec date du ".date('Y-m-d')." et la date du 2030-01-15 = ";
echo "\n";
getTimeLeft("2030-01-15");
echo "\n";

echo "Ecart avec date du ".date('Y-m-d')." et la date du 2026-01-10 = ";
echo "\n";
getTimeLeft("2026-01-10");
echo "\n";

echo "Ecart avec date du ".date('Y-m-d')." et la date du 2025-11-17 = ";
echo "\n";
getTimeLeft("2025-11-17");
echo "\n";

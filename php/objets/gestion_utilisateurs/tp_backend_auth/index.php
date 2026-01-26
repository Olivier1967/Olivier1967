<!DOCTYPE html>
<html lang="fr-FR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./src/assets/css/style.css">
  <link rel="stylesheet" href="./src/assets/css/form.css">
  <title><?php $titre= "Foire aux Vins"; echo $titre; ?> </title>
</head>

<body>
<?php 
session_start();

use src\dao\CandidateRepository;
use src\dao\DepartmentRepository;
use src\dao\Dbconnexion;
require "./vendor/autoload.php";

// require "./src/dao/CandidateRepository.php";
// require "./src/dao/Dbconnexion.php";
// require "./src/dao/DepartmentRepository.php";
require "./src/controllers/controllerInscription.php";
require "./src/controllers/CtrlAccueil.php";
require "./src/controllers/CtrlInscription.php";
require "./src/controllers/CtrlLogin.php";
require "./src/controllers/CtrlCompte.php";

if(isset($_GET['page'])){
        $path= $_GET['page']??"home";
        
    }else{
        $path="home";
    }

    $path = $_GET['page'] ?? 'home';


    switch ($path) {
        case 'inscription':
            CtrlInscription();
            //controllerInscription();
            break;

        case 'home':
            CtrlAccueil();
            //include "./view/home.php";
            break;

        case 'login':
            CtrlLogin();
            //include "./view/login.php";
            break;

        case "compteperso":
            CtrlCompte();
            break;

        default:
            CtrlAccueil();
            //include "./view/home.php";
            break;
    }
?>

<footer></footer>
</body>

</html>
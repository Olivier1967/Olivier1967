<?php
require "./Dbconnexion.php";
require "./RestaurantRepository.php";

//method $GET

if (isset($_GET['id'])) {
    $id = (int)$_GET['id'];
    $objResto = new RestaurantRepository();

    if ($objResto->deleteRestaurant($id)) {
        echo "Restaurant deleted successfully!";
        header("Location: ../viewTable.php");
        exit();
    } else {
        echo "Error deleting restaurant.";
    }
} else {
    echo "No ID provided.";
}

// method post
/*
$msg="";
$objResto = new RestaurantRepository();
if ($_SERVER["REQUEST_METHOD"]=="POST"){
    if (!empty($_POST["suppr"])){
        $test=$objResto->deleteRestaurant($_POST["suppr"]);
        if ($test){
            $msg="la ligne a bien été supprimée";
            sleep(10);
            header('Location:http://localhost/objets/gestion_utilisateurs/restaurants/menu.php');
        }else{
            $msg="Erreur suppression";
        }
    }

}
*/


<?php
/**
 * retourne "hello $name"
 * @param string $name le nom à afficher
 */

function hello(string $name) : string
{
    return 'hello'.$name;
}

// test de la fonction
 echo hello(" Oliver\n");

 function hello2(string $name2) : string
 {

    if ($name2 == null){
        return "hello nobody\n";
    } else {
        return "hello $name2\n";
    }

 }

  echo hello2("");
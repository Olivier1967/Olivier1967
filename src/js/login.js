
const myForm = document.getElementById('myform');
const email = document.getElementById("email");
const password = document.getElementById("password");

myForm.addEventListener('submit', function(event){

    event.preventDefault();

    const isEmailValid = validateEmail(email.value);
    const isPasswordValid= validatePassword(password.value);

    if(isEmailValid && isPasswordValid){
        window.location.replace("accueil.html");
        
    }else{
        alert('Erreur: Vérifier votre saisie');
        window.location.replace("./index.html");
        
    }

});


function validateEmail(_email){
    let idemail = "makkenzie@gmail.com";

    if(idemail === _email){
        return true;
    } else {
        return false;
    }

}

function validatePassword(_pass){
    let myPassword = "123456";

       if(myPassword === _pass){
        return true;
    } else {
        return false;
    }
}
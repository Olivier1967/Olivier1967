    const monbtn= document.querySelector("#contactus-submit");
    monbtn.addEventListener("click", function(){
        window.location.href='./viewTable.php';
    });

var r= $('<i class="fa fa-spinner fa-spin"></i>');
$("#contactus-submit").html(r);
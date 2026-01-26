
/*const menu = document.querySelector(".menu");
const menuList = document.querySelector(".menu-list");
const menuToggle = document.querySelector(".menu .button");
menuToggle.addEventListener("click", function () {
  menu.classList.toggle("active");
  menuList.classList.toggle("active");
});
*/
const menuToggle = document.querySelector(".menu .button");
const mainMenuItem = document.getElementById('main-menu');
const submenu = document.querySelector('.submenu');

// Toggle main menu display when button is clicked
menuToggle.addEventListener("click", function () {
    menu.classList.toggle("active");
});

// Handle submenu toggle when the main menu item is clicked
mainMenuItem.addEventListener('click', function (event) {
    event.preventDefault();  // Prevent default link behavior
    submenu.classList.toggle('active'); // Toggle submenu visibility
});
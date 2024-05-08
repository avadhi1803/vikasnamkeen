document.addEventListener("DOMContentLoaded", function () {
    let searchBtn = document.querySelector("#search-btn");
    let searchBar = document.querySelector(".search-bar-container");
    let menu = document.querySelector("#menu-bar");
    let navBar = document.querySelector(".navbar");
    //login form js
    let formBtn = document.querySelector("#login-btn");
    let loginForm = document.querySelector("#login-form-container");
    let formClose = document.querySelector("#form-close");

    // Rest of your JavaScript code here

    window.onscroll = () => {
        searchBtn.classList.remove('fa-times');
        searchBar.classList.remove('active');
        menu.classList.remove('fa-times');
        navBar.classList.remove('active');
        //login form js
        loginForm.classList.remove('active');
    };

    menu.addEventListener('click', () => {
        menu.classList.toggle('fa-times');
        navBar.classList.toggle('active');
    });

    searchBtn.addEventListener('click', () => {
        searchBtn.classList.toggle('fa-times');
        searchBar.classList.toggle('active');
    });

    //login form js
    formBtn.addEventListener('click', () => {
        loginForm.classList.add('active');
    });

    formClose.addEventListener('click', () => {
        loginForm.classList.remove('active');
    });
});

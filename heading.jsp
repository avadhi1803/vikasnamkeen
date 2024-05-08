<%-- 
    Document   : heading
    Created on : Oct 8, 2023, 12:29:41 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <style>
            /* Reset and common styles */
* {
    font-family: 'Nunito', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-transform: capitalize;
    outline: none;
    border: none;
    text-decoration: none;
    transition: all .2s linear;
}

::selection {
    background: var(--orange);
    color: white;
}

/* HTML styles */
:root {
    --orange: #eda961;
}

html {
    font-size: 62.5%;
    overflow-x: hidden;
    scroll-padding-top: 6rem;
    scroll-behavior: smooth;
}

/* Section styles */
section {
    padding-top: .5rem;
}

/* Heading styles */
.heading {
    text-align: center;
    padding: 2.5rem 0;
    margin-bottom: 5vh;
    margin-top: 5vh;
}

.heading span {
    font-size: 3.5rem;
    background: rgba(255, 165, 0, .2);
    color: var(--orange);
    border-radius: .5rem;
    padding: .2rem 1rem;
}

.heading span.space {
    background: none;
}

/* Button styles */
.btn {
    display: inline-block;
    margin-top: 1rem;
    background: var(--orange);
    color: white;
    padding: .8rem 3rem;
    border: .2rem solid var(--orange);
    cursor: pointer;
    font-size: 1.7rem;
}

.btn:hover {
    background: rgba(255, 165, 0, .2);
    color: var(--orange);
}

/* Header styles */
header {
    position: relative;
    top: 0;
    left: 0;
    right: 0;
    background: #333;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 2rem 9%;
    z-index: 1;
}

header .logo {
    font-size: 2.5rem;
    font-weight: bolder;
    color: white;
    text-transform: uppercase;
    text-decoration: none;
}

header .logo span {
    color: var(--orange);
}

header .navbar a {
    color: white;
    font-size: 2rem;
    margin: 0 .8rem;
    text-decoration: none;
}

header .navbar a:hover {
    color: var(--orange);
}

header .icons i {
    font-size: 2.5rem;
    color: white;
    cursor: pointer;
    margin-right: 2rem;
}

header .icons i:hover {
    color: var(--orange);
}

header .search-bar-container {
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    padding: 1.5rem 2rem;
    background: #333;
    border-top: .1rem solid rgba(255, 255, 255, .2);
    display: flex;
    align-items: center;
    z-index: 1001;
    clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);
}

header .search-bar-container.active {
    clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
}

header .search-bar-container #search-bar {
    width: 100%;
    padding: 1rem;
    text-transform: none;
    color: #333;
    font-size: 1.7rem;
    border-radius: .5rem;
}

header .search-bar-container label {
    color: white;
    cursor: pointer;
    font-size: 3rem;
    margin-left: 1.5rem;
}

header .search-bar-container label:hover {
    color: var(--orange);
}

#menu-bar {
    color: white;
    border: .1rem solid white;
    border-radius: .5rem;
    font-size: 3rem;
    padding: .5rem 1.2rem;
    cursor: pointer;
    display: none;
}

/* Media queries for responsiveness */
@media (max-width: 1200px) {
    html {
        font-size: 55%;
    }
}

@media (max-width: 991px) {
    header {
        padding: 2rem;
    }
    section {
        padding: 2rem;
    }
}

@media (max-width: 768px) {
    #menu-bar {
        display: initial;
    }

    header .navbar {
        position: absolute;
        top: 100%;
        right: 0;
        left: 0;
        background: #333;
        border-top: .1rem solid rgba(255, 255, 255, .2);
        padding: 1rem 2rem;
        clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);
    }

    header .navbar.active {
        clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
    }

    header .navbar a {
        display: block;
        border-radius: .5rem;
        padding: 1.5rem;
        margin: 1.5rem 0;
        background: #222;
    }
}

@media (max-width: 450px) {
    html {
        font-size: 50%;
    }

    .heading span {
        font-size: 2.5rem;
    }

    .contact .row form .inputBox input {
        width: 100%;
    }
}

        </style>
    </head>
    <body>
        <header>
        <div id="menu-bar" class="fas fa-bars"></div>

        <a href="#" class="logo"><span>VIKAS</span>NAMKEEN</a>

        <nav class="navbar">
            <a href="index.jsp#home">Home</a>
            <a href="index.jsp#gallery">Products</a>
            <a href="index.jsp#features">Features</a>
            <a href="index.jsp#packages">Best Selling</a>
            <a href="customerOrder.jsp">Orders</a>
            <a href="review.jsp">Review</a>
            <a href="index.jsp#contact">Reach Us</a>
        </nav>
        <div class="icons">
            
            <a href="store.jsp"><i class="fas fa-shopping-cart" id="cart-btn"></i></a>
            <a href="signup.jsp"><i class="fas fa-user" id="login-btn"></i></a>
        </div>


    </header>
    </body>
</html>

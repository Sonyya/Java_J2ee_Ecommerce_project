<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="VO.*" %>
  <%@page import="DAO.*" %>
   <% ClientVO client = new ClientVO(); %>
   
     <% ClientDAO clDAO = new ClientDAO(); %>
  <% if(session.getAttribute("clientInfo") != null){%>
  <%client = (ClientVO)session.getAttribute("clientInfo"); %>
  <% System.out.println(client.toString()); %>
       <% System.out.println(" EstAdmin: " + client.getEstAdmin()); %>
 
  <% }%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title> GMS </title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <!--link qui permettra de charger les goocles icons-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
      <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
      <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet'>
    
      
      <!-- Calling jquery first -->
<script language="JavaScript" type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- Carousel -->
   
    <!-- Custom styl     es for this template -->
    <link rel="stylesheet" type="text/css" href="css/Accueil.css">
          <link rel="stylesheet" type="text/css" href="css/animate.css">
      <script src = "js/navbarColorChange.js"></script>
       <script src = "js/toggleNavBarColor.js"></script>
      <script src ="js/carouselSlider.js" ></script>
    </head>
    <body>

         <nav class="navbar navbar-expand-md navbar-light fixed-top">
           <a class="navbar-brand" href="#" id = "logoImage"><img src="images/logo.png"
                              alt="Logo" height="100" width= "200">
        
             </a>
             <a class="navbar-brand" href="#">
                            <div id = "Title">
                                Grace Multi Services
                            </div>
             </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="Accueil.jsp">Accueil <span class="sr-only">(current)</span></a>
              </li>

               <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Langue
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: burlywood; opacity: 0.8;">
                    <a class="dropdown-item" href=""> <img src="images/france-flag-waving-icon-64.png" class="img-fluid" alt=" image drapeau de la france" width="32px" > <Strong>Fr </Strong></a>
                    <a class="dropdown-item" href=""> <img src="images/united-states-of-america-flag-waving-icon-64.png" class="img-fluid" alt="image drapeau des USA" width="32px"> <Strong>En</Strong></a>

                </div>
              </li>
               <% if(session.getAttribute("clientInfo") != null && client.getEstAdmin() == false ){%>
              <li class="nav-item ">
              	
                <a class="nav-link" href="ShopServelet">Magaziner</a>
              </li>
               <% }%>
              <li class="nav-item ">
                <a class="nav-link" href="ContactUs.jsp">Contactez-Nous</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="AboutUs.jsp">A propos</a>
              </li>
               <% if(session.getAttribute("clientInfo") != null){%>


                 <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   <i class="material-icons" style="color:black">account_circle</i>
                   <% out.print("Hi "+client.getPrenom() + "!"); %>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: burlywood; opacity: 0.8;">
                <% if(client.getEstAdmin() == false){%>
                	
                
                	<a class="dropdown-item" href="CommandeServelet">Mes Commandes</a>
                  <a class="dropdown-item" href="#">Mon Compte</a>
                  <a class="dropdown-item" href="logoutServelet">Se deconnecter</a>
                <% }else {%>
                	<a class="dropdown-item" href="cmdAdminServelet">Gestion Commandes</a>
                  <a class="dropdown-item" href="ShopServelet">Gestion des Produits</a>
                  <a class="dropdown-item" href="logoutServelet">Se deconnecter</a>
                
                <% }%>
                
                
                 
                </div>
              </li>
                <%} else{%>
                
                             <li class="nav-item ">
                  <!--span class="glyphicon glyphicon-user">login</span-->
                     <a class="nav-link" href="login.jsp">
               
                        <i class="material-icons" style="color:black">account_circle</i>
                  </a>
              </li>
                <% }%>
 
      				<li class="nav-item">

                    <%if(session.getAttribute("clientInfo") != null) { %>
                      <a class="nav-link" href="CardServelet">
                      <i class="material-icons" style="color:black">shopping_cart</i>
                    <span class='badge badge-warning' id='lblCartCount'> <% out.print(clDAO.getNombreItemPanier(client.getId()));%> </span>
                    <%} else{%>
                    	<a class="nav-link" href="Card.jsp">
                        <i class="material-icons" style="color:black">shopping_cart</i>
                    <%} %>
                </a>
              </li>
              
            </ul>
          </div>
        </nav>

        <main role="main" class="container-fluid " style="padding: 0" >

            <div id= "carouselDiv" class= "row"  style = "padding-bottom: 95vh">

                <div class= "col-lg-12 " style="padding: 0; position: absolute; top: 0" >
                    <!--img   class="img-fluid" src="/images/sweet-ice-cream-photography-SurmPrJ4Rts-unsplash.jpg"
                              alt="imagePub"-->
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                      <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                      </ol>
                            
                      <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            
                        <div class="banner" style= "background-image: url(images/irina-iriser-AV0M5WwJGwM-unsplash.jpg)"></div>
                            <div class= "carousel-caption">
                                <h2 class="animated bounceInRight" style="animation-delay: 1s"> GMS = <span> Creativtité </span></h2>
                                <h3 class="animated bounceInLeft" style="animation-delay: 2s">Service de Vente de meubles et de Decorations</h3>
                                <p class="animated bounceInRight" style="animation-delay: 3s"><a href="#">Contact us </a></p>
                            </div>
                        </div>
                        <div class="carousel-item">
                           <div class="banner" style= "background-image: url(images/helloquence-5fNmWej4tAA-unsplash.jpg)"></div>
                            <div class= "carousel-caption">
                                <h2 class="animated slideInDown" style="animation-delay: 1s"> GMS = <span> Productivité</span></h2>
                                <h3 class="animated fadeInUp" style="animation-delay: 2s">organisation d' evenement</h3>
                                <p class="animated zoomIn" style="animation-delay: 3s"><a href="#">Contactez-Nous</a></p>
                            </div>
                        </div>
                        <div class="carousel-item">
                           <div class="banner" style= "background-image: url(images/honey-yanibel-minaya-cruz-laORtJZaieU-unsplash.jpg)"></div>
                            <div class= "carousel-caption">
                                <h2 class="animated zoomIn" style="animation-delay: 1s"> GMS rime avec <span> innovation </span></h2>
                                <h3 class="animated fadeInLeft" style="animation-delay: 2s">planification budgetaire</h3>
                                <p class="animated zoomIn" style="animation-delay: 3s"><a href="#">A propos De Nous </a></p>
                            </div>
                        </div>
                      </div>
                      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                      </a>
                    </div>
                </div>
            </div>
            <div class= "row">
                 <div class= "col-lg-4">
                     <img class="d-block w-100 mb-3 " src="images/stil--837JygbCJo-unsplash.jpg"
                              alt="Prendre RDV"  height="400">
                </div>
                <div class= "col-lg-4">
                    <img class="d-block w-100 mb-3" src="images/mickel-alexander-82p7JgzKOpo-unsplash.jpg"
                              alt="Louer des articles" height="400">
                </div>
                <div class= "col-lg-4">
                    <img class="d-block w-100 mb-3 " src="images/lesly-juarez-1AhGNGKuhR0-unsplash.jpg"
                              alt="temoignage" height="400">
                </div>

            </div>


        </main><!-- /.container -->
    </body>
     
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="VO.*" %>
  <%@page import="DAO.*" %>
     <% ClientDAO clDAO = new ClientDAO(); %>
      <% boolean EstAdmin = false;%>
     <% ClientVO client = new ClientVO(); %>
  <% if(session.getAttribute("clientInfo") != null){%>
  <%client = (ClientVO)session.getAttribute("clientInfo"); %>
  <%EstAdmin = client.getEstAdmin(); %>
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
      <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
      <!-- Calling jquery first -->
	<script language="JavaScript" type="text/javascript" src="js/bootstrap.min.js"></script>
    
  <!-- Carousel -->
   
    <!-- Custom styl     es for this template -->
    <link rel="stylesheet" type="text/css" href="css/login.css">
          <link rel="stylesheet" type="text/css" href="css/animate.css">
      <script src = "js/navbarColorChange.js"></script>
		<script src = "js/encryption.js"></script>
		       <script src = "js/toggleNavBarColor.js"></script>
    </head>
    <body>

         <nav class="navbar navbar-expand-md navbar-light fixed-top " style="padding: 0">
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
              <li class="nav-item ">
                <a class="nav-link" href="Accueil.jsp">Accueil <span class="sr-only">(current)</span></a>
              </li>
 			<li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Langue
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: burlywood; opacity: 0.8;">
                    <a class="dropdown-item" href="#"> <img src="images/france-flag-waving-icon-64.png" class="img-fluid" alt=" image drapeau de la france" width="32px" > <Strong>Fr </Strong></a>
                    <a class="dropdown-item" href="#"> <img src="images/united-states-of-america-flag-waving-icon-64.png" class="img-fluid" alt="image drapeau des USA" width="32px"> <Strong>En</Strong></a>

                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="ShopServelet">Magaziner</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="ContactUs.jsp">Contact Us</a>
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
                <div class="dropdown-menu" aria-labelledby="navbarDropdown"style="background-color: burlywood; opacity: 0.8;">
                <% if(!EstAdmin){%>
                
                	<a class="dropdown-item" href="CommandeServelet">Mes Commandes</a>
                  <a class="dropdown-item" href="#">Mon Compte</a>
                  <a class="dropdown-item" href="logoutServelet">Se deconnecter</a>
                <% }else {%>
                	<a class="dropdown-item" href="cmdAdminServelet">Gestion Commandes</a>
                  <a class="dropdown-item" href="#">Gestion des Produits</a>
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

        <main role="main" class="container-fluid  mt-5 "style="padding: 0" >

                <div class="LeavesFall">
                    <div><img src="images/Feuilles/feuille_1.png"></div>
                    <div><img src="images/Feuilles/feuille_2.png"></div>
                    <div><img src="images/Feuilles/feuille_3.png"></div>
                    <div><img src="images/Feuilles/feuille_4.png"></div>
                    <div><img src="images/Feuilles/feuille_1.png"></div>
                    <div><img src="images/Feuilles/feuille_2.png"></div>
                    <div><img src="images/Feuilles/feuille_3.png"></div>
                    <div><img src="images/Feuilles/feuille_4.png"></div>
                   
                </div>
                 <div class="LeavesFall set2">
                    <div><img src="images/Feuilles/feuille_1.png"></div>
                    <div><img src="images/Feuilles/feuille_2.png"></div>
                    <div><img src="images/Feuilles/feuille_3.png"></div>
                    <div><img src="images/Feuilles/feuille_4.png"></div>
                    <div><img src="images/Feuilles/feuille_1.png"></div>
                    <div><img src="images/Feuilles/feuille_2.png"></div>
                    <div><img src="images/Feuilles/feuille_3.png"></div>
                    <div><img src="images/Feuilles/feuille_4.png"></div>
                   
                </div>
                 <div class="LeavesFall set3">
                    <div><img src="images/Feuilles/feuille_1.png"></div>
                    <div><img src="images/Feuilles/feuille_2.png"></div>
                    <div><img src="images/Feuilles/feuille_3.png"></div>
                    <div><img src="images/Feuilles/feuille_4.png"></div>
                    <div><img src="images/Feuilles/feuille_1.png"></div>
                    <div><img src="images/Feuilles/feuille_2.png"></div>
                    <div><img src="images/Feuilles/feuille_3.png"></div>
                    <div><img src="images/Feuilles/feuille_4.png"></div>
                   
                </div>

            <div class= "row">
                <div class= "col-sm-12">
                    <div class="Box">
							<%if(request.getAttribute("ErreurLoginInfo") != null || request.getAttribute("ErreurEmailInfo") != null){ %>
											<%String message = request.getAttribute("ErreurLoginInfo") != null? (String)request.getAttribute("ErreurLoginInfo") : (String)request.getAttribute("ErreurEmailInfo") ; %>
							             <div class="alert alert-danger" role="alert">
							             <%System.out.println("L' Erreur est est :"+message); %>
  										<%out.print(message); %>
										</div>
							<%} %>
                        <form action="LoginServelet" name="login_form" method="get">
                              <div class="form-group">
                                <label for="InputEmail">Adresse Email</label>
                                <input type="email" class="form-control" id="InputEmail" name = "InputEmail" aria-describedby="emailHelp" placeholder="Entrer votre adresse Mail " required>
                             
                              </div>
                              <div class="form-group">
                                <label for="InputPassword">Mot de Passe</label>
                                <input type="password" class="form-control" id="InputPassword" name= "InputPassword" placeholder="Entrer votre Mot De Passe" required>
                              </div>
                              <div class="form-group form-check">
                                <label> Pas Encore Enregistrer?</label>
                                <a href="Inscription.jsp">Inscrivez vous ici</a>
                              </div>
                              <button type="submit" class="btn btn-primary" onClick="doSubmit()">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
            
        </main><!-- /.container -->
    </body>

    
</html>

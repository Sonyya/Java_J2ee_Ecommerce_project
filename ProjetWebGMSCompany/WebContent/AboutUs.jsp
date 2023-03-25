<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="VO.*" %>
  <%@page import="DAO.*" %>
    <%@page import="java.util.*"%>
	<%@page import="FonctionUtilitaire.*" %>
   <% ClientVO client = new ClientVO(); %>
   <% boolean EstAdmin = false;%>
     <% ClientDAO clDAO = new ClientDAO(); %>
  <% if(session.getAttribute("clientInfo") != null){%>
  <%client = (ClientVO)session.getAttribute("clientInfo"); %>
  <%EstAdmin = client.getEstAdmin(); %>
  <% }%>
<% GestionLangue gl= new GestionLangue();

		
		ResourceBundle Navbar;
		ResourceBundle Message;
		
		Navbar=ResourceBundle.getBundle("properties.Navbar", 
				new Locale(gl.getLangue(), gl.getPays()));
		Message=ResourceBundle.getBundle("properties.Message", 
				new Locale(gl.getLangue(), gl.getPays()));

%>


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
    <link rel="stylesheet" type="text/css" href="css/AboutUs.css">
          <link rel="stylesheet" type="text/css" href="css/animate.css">
      <script src = "js/navbarColorChange.js"></script>
             <script src = "js/toggleNavBarColor.js"></script>
      <script src = "js/ToggleLanguage.js"></script>

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
              <li class="nav-item ">
                <a class="nav-link" href="Accueil.jsp" id="accueil"><span class="sr-only">(current)</span></a>
              </li>
               <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Langue
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: burlywood; opacity: 0.8;">
                    <a class="dropdown-item" href="" id= "Francais" onClick= "Francais()" > <img src="images/france-flag-waving-icon-64.png" class="img-fluid" alt=" image drapeau de la france" width="32px" > <Strong>Fr </Strong></a>
                    <a class="dropdown-item" href="" id= "English" onClick= "English()" > <img src="images/united-states-of-america-flag-waving-icon-64.png" class="img-fluid" alt="image drapeau des USA" width="32px"> <Strong>En</Strong></a>

                </div>
              </li>
              <li class="nav-item ">

                <a class="nav-link" href="ShopServelet" id="shop">Magaziner</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="ContactUs.jsp" id="contact">Contactez-Nous</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="AboutUs.jsp" id="about">A propos</a>
              </li>
			<% if(session.getAttribute("clientInfo") != null){%>

                 <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   <i class="material-icons" style="color:black">account_circle</i>
                      <% out.print("Hi "+client.getPrenom() + "!"); %>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: burlywood; opacity: 0.8;">
                <% if(!EstAdmin){%>
                
                	<a class="dropdown-item" href="CommandeServelet" id="cmdUser">Mes Commandes</a>
						  <a class="dropdown-item" href="logoutServelet" id="logout">Se Deconnecter</a>
                <% }else {%>
                	<a class="dropdown-item" href="cmdAdminServelet" id="cmdAdmin">Gestion Commandes</a>
                  <a class="dropdown-item" href="#" id="produit" >Gestion des Produits</a>
                  <a class="dropdown-item" href="logoutServelet" id="logout">Se Deconnecter</a>
                
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
           
            <div class= "row" id="row1">
               
                   <div class= "col-lg-5 ml-5" style="padding: 0; top: 0; left:0" >
                      
                           <div id="ImgIllustratif">
                           <img src="images/aina-vine-OxLlrZRDiBA-unsplash.jpg" class="img-fluid" alt="ceci est une photo de mademoiselle Sonia Wang" height = "100px">
                           </div>
                           <div id= "CarreDeco"></div>  
                    </div>
                    <div class= "col-lg-5 ml-5 mr-2 " style="padding: 0; top: 0" id= "textPart">
                          <div class= "Box">
                                <div class= "presentation">
                                    <p id="titre"><strong> <i>
                                       QUI SUIS-JE? 
                                        </i>
                                        </strong>
                                    </p>
                                     <p id= "contenu">
                                        Je m'appelle Grace Elibi, a eu la chance de commencer dans levenementiel a lage de 16 ans avec l organisation des soirees culturel sur le campus de lecole secondaire, 
                                        pour des amis. Et apres commence a travaillee avec des entreprises, des associations (communite of black History Month (volontariat 16 ans, organisait des defile de mode, conference), organisation de la soiree culturelle de l universite d ottawa. 
                                        Et tout cela a permis d avoir des prix. Ainsi, conduit par ma passion,jai  decid&eaute; d offrir mes services online et un vente de decoration pour evenement en ligne

                                    </p>
                                </div>  
                            </div>
                    </div>
                </div>
           
        </main><!-- /.container -->
    </body>

</html>

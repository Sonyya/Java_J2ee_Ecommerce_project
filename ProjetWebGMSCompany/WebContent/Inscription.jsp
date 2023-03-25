<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="VO.*" %>
  <%@page import="DAO.*" %>
  
   <% ClientVO client = new ClientVO(); %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title> GMS </title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <!--link qui permettra de charger les goocles icons-->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
      <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
         <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet'>
      
      <!-- Calling jquery first -->
<script language="JavaScript" type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- Carousel -->
   
    <!-- Custom styl     es for this template -->
    <link rel="stylesheet" type="text/css" href="css/Incription.css">
          <link rel="stylesheet" type="text/css" href="css/animate.css">

    </head>
    <body>

         <nav class="navbar navbar-expand-md navbar-light fixed-top">
           <a class="navbar-brand" id = "logoImage" href="#">
               
                         <img src="images/logo.png"
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
                <a class="nav-link" href="Shop.jsp">Magaziner</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="ContactUs.jsp">Contactez-Nous</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="AboutUs.jsp">A propos</a>
              </li>
              <li class="nav-item active">
                  <!--span class="glyphicon glyphicon-user">login</span-->
                     <a class="nav-link" href="login.jsp">
                  
                        <i class="material-icons" style="color:black">account_circle</i>
                  </a>
              </li>
                <li class="nav-item">
                <a class="nav-link" href="Card.jsp">
                        <i class="material-icons" style="color:black">shopping_cart</i>
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
                    	<%if(request.getAttribute("PasMemeMdp") != null || request.getAttribute("EmailExiste") != null){ %>
							<%String message = request.getAttribute("EmailExiste") != null? (String)request.getAttribute("EmailExiste") : (String)request.getAttribute("PasMemeMdp") ; %>
							           <div class="alert alert-danger" role="alert">
							  <%System.out.println("L' Erreur est est :"+message); %>
  								<%out.print(message); %>
										</div>
							<%} %>

                        <form action="inscriptionServelet" name="formIncription" method="get">
                            <div class="form-group" >
                                <label for="InputNom">Nom</label>
                                <input type="Text" class="form-control" id="InputNom" name="InputNom" aria-describedby="Npm" placeholder="Entrer votre Nom" required>
                              </div>
                            
                            <div class="form-group">
                                <label for="InputPrenom">Prenom</label>
                                <input type="Text" class="form-control" id="InputPrenom"  name="InputPrenom" aria-describedby="Prenom" placeholder="Entrer votre Prenom" required>
                             
                              </div>
                            
                             <div class="form-group">
                                <label for="InputTelephone">Téléphone</label>
                                <input type="Text" class="form-control" id="InputTelephone" name="InputTelephone" aria-describedby="Telephone" placeholder="Entrer votre numero de Telephone" required>
                             
                              </div>
                            
                              <div class="form-group">
                                <label for="InputEmail">Email</label>
                                <input type="email" class="form-control" id="InputEmail" name="InputEmail" aria-describedby="emailHelp" placeholder="123@gmail.com" required>
                             
                              </div>
                            <div class="form-group">
                                <label for="InputPays">Pays</label>
                                <input type="text" class="form-control" id="InputPays" name="InputPays" aria-describedby="emailHelp" placeholder="pays" required>
                              </div> 
                              
                                <div class="form-group">
                                <label for="InputRegion">Region</label>
                                <input type="text" class="form-control" id="InputRegion" name="InputRegion" aria-describedby="emailHelp" placeholder="region" required>
                              </div>
                              
                               <div class="form-group">
                                <label for="InputVille">Ville</label>
                                <input type="text" class="form-control" id="InputVille" name="InputVille" aria-describedby="emailHelp" placeholder="ville" required>
                              </div>
                              
                                <div class="form-group">
                                <label for="InputAdresse">Adresse</label>
                                <input type="text" class="form-control" id="InputAdresse" name="InputAdresse" aria-describedby="emailHelp" placeholder="adresse" required>
                              </div>
                        
                              <div class="form-group">
                                <label for="Inputpostal">Code Postal</label>
                                <input type="text" class="form-control" id="Inputpostal" name="Inputpostal" aria-describedby="emailHelp" placeholder="code postal"required>
                              </div>
                            
                              <div class="form-group">
                                <label for="InputPassword">Mot de Passe</label>
                                <input type="password" class="form-control" id="InputPassword" name="InputPassword" placeholder="Entrer votre Mot De Passe" required>
                              </div>
                            	
                            	
                            	
                              <div class="form-group">
                                <label for="InputPassword2">Reentrer Votre Mot de Passe</label>
                                <input type="password" class="form-control" id="InputPassword2" name="InputPassword2" placeholder="R&eacute;entrer votre Mot De Passe"required>
                              </div>
                            
                            
                              <div class="form-group form-check">
                                Deja Enregistrer?
                                <a href="login.jsp">OUvrez votre session ici</a>
                              </div>
                              <button type="submit" class="btn btn-primary" onClick="doSubmit()" >Soumettre</button>
                        </form>
                    </div>
                </div>
            </div>
            
        </main>
        
        <script src = "js/navbarColorChange.js"></script>
             <script src = "js/toggleNavBarColor.js"></script>
		<script src = "js/encriptionInscription.js"></script>
    </body>
      
    
</html>

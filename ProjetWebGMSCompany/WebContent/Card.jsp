<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList" %>
 <%@page import="VO.*" %>
  <%@page import="DAO.*" %>
     <% ClientVO client = new ClientVO(); %>
      <% boolean EstAdmin = false;%>
     <% ClientDAO clDAO = new ClientDAO(); %>
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
      
      <!-- Calling jquery first -->
<script language="JavaScript" type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- Carousel -->
   
    <!-- Custom styl     es for this template -->
    <link rel="stylesheet" type="text/css" href="css/Card.css">
          <link rel="stylesheet" type="text/css" href="css/animate.css">
      <script src = "js/navbarColorChange.js"></script>
       <script src = "js/plusAndMinus.js"></script>
              <script src = "js/toggleNavBarColor.js"></script>

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
              <li class="nav-item active ">
                <a class="nav-link" href="ShopServelet">Shop</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="ContactUs.jsp">Contact Us</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="AboutUs.jsp">About Us</a>
              </li>
				<% if(session.getAttribute("clientInfo") != null){%>


                 <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   <i class="material-icons" style="color:black">account_circle</i>
                      <% out.print("Hi "+client.getPrenom() + "!"); %>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: burlywood; opacity: 0.8;">
                <% if(!EstAdmin){%>
                
                	<a class="dropdown-item" href="CommandeServelet">Mes Commandes</a>
                  <a class="dropdown-item" href="#">Mon Compte</a>
                  <a class="dropdown-item" href="logoutServelet">logout</a>
                <% }else {%>
                	<a class="dropdown-item" href="cmdAdminServelet">Gestion Commandes</a>
                  <a class="dropdown-item" href="#">Gestion des Produits</a>
                  <a class="dropdown-item" href="logoutServelet">logout</a>
                
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
        <%if(session.getAttribute("clientInfo") != null) {%>
        	<% ArrayList<PanierVO>listPanier = (ArrayList)request.getAttribute("panierList") ;%>
  			<% System.out.println(listPanier.size() + " est la TAILLE"); %>
  			<%if(listPanier.size() == 0){ %>
  			<div class="row">
                <div class= "box2">
                     <div class= "titre">
                          <Strong> PANIER VIDE!!! </Strong>
                    </div>

                    <div class= "loginBtn">
                     <a href="ShopServelet" class="btn btn-primary">Magazinner Maintenant</a>
                    </div>
                </div>
            </div>
  			
  			<%} else{ %>
        	<% float SommeTotal = 0; %>
			<% ProduitDAO pDAO = new ProduitDAO();%>
			<div class="row"> 
                <table>
                   <tr>
                     <th>image</th>
                     <th>nom+description</th>
                     <th>prix unitaire</th>
                     <th>qte prise</th>
                     <th>delete</th>
                   </tr>
			<%for(int i = 0; i < listPanier.size(); i++){ %>
			<% PanierVO itemCourant = (PanierVO) listPanier.get(i); %>
			<% ProduitVO produitCourant = (ProduitVO)(pDAO.getProduitById(itemCourant.getProduitID())); %>
			<% int QuantiteVoulu = itemCourant.getQteVoulu();%>
			<% float prixParItem = (float) (QuantiteVoulu * produitCourant.getPrix()); %>
			<% SommeTotal += prixParItem; %>
					<form  action="deleteItemPanier" method="get">
                    <%System.out.println("FORM exec"); %>
                      <tr>
                        <td><img src="<%out.print(produitCourant.getPhotoUrl()); %>" alt="ceci est une photo de mademoiselle Sonia Wang" height = "100px" width="100px"></td>
                        <td>
                            <p><%out.print(produitCourant.getNom()); %></p>
                            <p><%out.print(produitCourant.getdescription()); %></p>
                        </td>
                        <td><%out.print(produitCourant.getPrix());%>$</td>
                          <td>
                            <div id= "Qte">

                                 <button type="button" class="quantity-left-minus" onclick="moins('quantity<%out.print(itemCourant.getProduitID()); %>')" data-type="-" data-field="">-</button>

                                    <input type="text" id="quantity<%out.print(itemCourant.getProduitID()); %>" name="quantity<%out.print(itemCourant.getProduitID()); %>" class="form-control input-number" value="<%out.print(itemCourant.getQteVoulu()); %>" min="0" max="100">

                                    <button type="button" class="quantity-right-plus" onclick="plus('quantity<%out.print(itemCourant.getProduitID()); %>')"data-type="+" data-field="">+</button>

                            </div>
                          </td>
                          <td>
                             <button href="#" type="submit" class="btn btn-primary" name="delete" value="<% out.print(itemCourant.getProduitID());%>">Delete</button>
                          </td>
                      </tr>
					 </form>
                   	 <%System.out.println("FORM closed"); %>
           
			<%} %>
			  </table>
			  </div>
            <div class="row">
                  <div class= "box">
                    <div id= "total"> Total:<strong> <%out.print(""+SommeTotal); %>$</strong> </div>
                  <a href="AddCommandeServelet" class="btn btn-primary" id="payementBtn"> proc&eacute;der au payement</a> 
                  <!-- bouton paypal -->
                  
                  <!-- Fin bouton paypal -->
                </div>
            </div>
           	<%} %>
            <%} else {%>
            <div class="row">
                <div class= "box2">
                     <div class= "titre">
                          <Strong> PANIER VIDE!!! </Strong>
                    </div>
                    <div class= "enonce">
                        Mais Par contre vous devez <strong>oblligatoirement</strong> login afin de pourvoir effectuer un achat.
                    </div>
                    <div class= "loginBtn">
                     <a href="login.jsp" class="btn btn-primary">Login</a>
                    </div>
                </div>
            </div>
            
            <%} %>
        </main><!-- /.container -->
    </body>
      <!--div class= "row mt-5" id = "BasDePage" >
        <div class= "col-sm-3">
            <footer class="row mt-2" > 
                <div class="col-sm-12"> 
                    
                <!--address>   
                <strong>Mon Adresse</strong><br>   
                273 Bruyere Street<br>   
                Ottawa, ON K1N 5E5, Canada<br>   
                <abbr title="Phone">P:</abbr> (613) 981-8816 
                </address> 

                <address>  
                 <strong>Sonia Wang, Futur C.Eng</strong><br>  
                 <a href="mailto:#">info@</a> </address> 
                <div id="date">      
                <script type="text/javascript">      
                 var d = new Date()       
                var mois = "";       
                document.write(d.getDate())       
                document.write(" ")       
                if (d.getMonth()+1 == 1) mois = "Janvier";      
                 if (d.getMonth()+1 == 2) mois = "Février";      
                 if (d.getMonth()+1 == 3) mois = "Mars";      
                 if (d.getMonth()+1 == 4) mois = "Avril";      
                 if (d.getMonth()+1 == 5) mois = "Mai";      
                 if (d.getMonth()+1 == 6) mois = "Juin"; 
                      if (d.getMonth()+1 == 7) mois = "Juillet";      
                 if (d.getMonth()+1 == 8) mois = "Aout";      
                 if (d.getMonth()+1 == 9) mois = "Septembre";      
                 if (d.getMonth()+1 == 10) mois = "Octobre";      
                 if (d.getMonth()+1 == 11) mois = "Novembre";  
                     if (d.getMonth()+1 == 12) mois = "Décembre";     
                  document.write(mois)       
                document.write(" ")    
                   document.write(d.getFullYear())    
                  </script>    
                 </div> 
                </div> 
            </footer> 

        </div>
    </div-->
    
</html>

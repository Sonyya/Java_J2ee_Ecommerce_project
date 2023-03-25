<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
 <%@page import="java.util.ArrayList" %>
 <%@page import="VO.*" %>
  <%@page import="DAO.*" %>
     <% ClientDAO clDAO = new ClientDAO(); %>
      <% boolean EstAdmin = false;%>
    <% ClientVO client = new ClientVO(); %>
  <% if(session.getAttribute("clientInfo") != null){%>
  <%client = (ClientVO)session.getAttribute("clientInfo"); %>
  <%EstAdmin = client.getEstAdmin(); %>
  <% }%>
 <% ArrayList<ProduitVO>listProduits = (ArrayList)request.getAttribute("produitList") ;%>
  <% System.out.println(listProduits.size() + " est la TAILLE"); %>
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
    <link rel="stylesheet" type="text/css" href="css/Shop.css">
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
                <a class="nav-link" href="ShopServelet">Magaziner</a>
              </li>
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
                           <!-- The Modal -->
          <div class="modal fade" id="myModal">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">OOPS: login avant de commander</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                  Vous devez avoir un compte avant de pouvoir commander sur ce site. Veuillez login ou vous enregistrez si jamais vous faites pas encore partie de la famille
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

              </div>
            </div>
          </div>
            
            <%for(int i = 0 ; i < listProduits.size(); i++) {%>
            	<%ProduitVO articleCourant = listProduits.get(i); %>
            	<%int id = articleCourant.getId(); %>
            	<% session.setAttribute("produitSelectionneID", id); %>
            	<%if(i%3 == 0 ){%>
	            	   <div class= "row">
            	<%}%>
            	<div class="col-sm-4">
                    <div class="card" style="width: 18rem;">
                    <% if(session.getAttribute("clientInfo") != null){%>
                    <form  action="AddCardServelet" method="get">
                    <%System.out.println("FORM exec"); %>
                    <%} %>
                      <img class="card-img-top" src="<% out.print(articleCourant.getPhotoUrl()); %>" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title"><% out.print(articleCourant.getNom()); %></h5>
                        <p class="card-text"><% out.print(articleCourant.getdescription()); %></p>
                        <div class= "PrixQte">
                            <div class= "col-sm-4">
                            <div id= "Prix"> <% out.print(articleCourant.getPrix()); %> </div>
                            </div>
                            <div class= "col-sm-8">
                            <div id= "Qte">

                                    <button type="button" class="quantity-left-minus"  onclick="moins('quantity<% out.print(articleCourant.getId()); %>')" data-type="-" data-field="">-</button>

                                    <input type="text" id="quantity<% out.print(id); %>" name="quantity" class="form-control input-number" value="0" min="0" max="100">


                                    <button type="button" class="quantity-right-plus"  onclick="plus('quantity<% out.print(id); %>')"data-type="+" data-field="">+</button>

                            </div>
                            </div>
                        </div>

                          <div class= "RentBtn">
                          <%if(session.getAttribute("clientInfo") != null){ %>
                          	 <button href="#" type="submit" name="buttonRent" class="btn btn-primary" value = "<%out.print(id);%>">Rent</button>
                          		
                          <%}else{ %>
                          	 <!-- a href="cardServelet" class="btn btn-primary">Rent</a-->
                          	 <a href="#" class="btn btn-primary"  data-toggle="modal" data-target="#myModal">Rent</a>
                          
                          <%} %>
                       
                          </div>
                      </div>
                     <% if(session.getAttribute("clientInfo") != null){%>
                   	 </form>
                   	 <%System.out.println("FORM closed"); %>
                    <%} %>
                     
                    </div>
                  
            </div>
            	<%if((i+1)%3 == 0 || (i+1) == listProduits.size()){%>
	            	 </div>
            	<%}%>
            <%}%>
            <!--  div class= "row">
                <div class="col-sm-4">

                    <div class="card" style="width: 18rem;">
                      <img class="card-img-top" src="images/rentalStuff/mickel-alexander-82p7JgzKOpo-unsplash.jpg" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">chaises de mariés</h5>
                        <p class="card-text">Il s' agit ici de deux chaises pour les futurs mariés ou pour la/les personne(s) à l'honneur</p>
                        <div class= "PrixQte">
                            <div class= "col-sm-4">
                            <div id= "Prix"> 50$ </div>
                            </div>
                            <div class= "col-sm-8">
                            <div id= "Qte">

                                    <button type="button" class="quantity-left-minus"  onclick="moins('quantity1')" data-type="-" data-field="">-</button>

                                    <input type="text" id="quantity1" name="quantity" class="form-control input-number" value="0" min="0" max="100">


                                    <button type="button" class="quantity-right-plus"  onclick="plus('quantity1')"data-type="+" data-field="">+</button>

                            </div>
                            </div>
                        </div>

                          <div class= "RentBtn">
                        <a href="#" class="btn btn-primary">Rent</a>
                          </div>
                      </div>
                    </div>
                  
            </div>
                
            <div class="col-sm-4">

                    <div class="card" style="width: 18rem;">
                      <img class="card-img-top" src="images/rentalStuff/ibrahim-boran-m8YjB0noWiY-unsplash.jpg" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">une table ronde + 9 chaises</h5>
                        <p class="card-text">Il s' agit ici de une tables rondes acoompagnée de 9 chaises, les deux de couleur doree</p>
                        <div class= "PrixQte">
                            <div class= "col-sm-4">
                            <div id= "Prix"> 150$ </div>
                            </div>
                            <div class= "col-sm-8">
                            <div id= "Qte">

                                    <button type="button" class="quantity-left-minus"  onclick="moins('quantity2')" data-type="-" data-field="">-</button>

                                    <input type="text" id="quantity2" name="quantity" class="form-control input-number" value="0" min="0" max="100">


                                    <button type="button" class="quantity-right-plus" onclick="plus('quantity2')" data-type="+" data-field="">+</button>

                            </div>
                            </div>
                        </div>

                          <div class= "RentBtn">
                        <a href="#" class="btn btn-primary">Rent</a>
                          </div>
                      </div>
                    </div>
                  
            </div>
            <div class="col-sm-4">

                    <div class="card" style="width: 18rem;">
                      <img class="card-img-top" src="images/rentalStuff/jacalyn-beales-Bz4ny7dRX7w-unsplash.jpg" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">chaise princier</h5>
                        <p class="card-text">Il s' agit ici d une chaise pour la personne à l'honneur</p>
                        <div class= "PrixQte">
                            <div class= "col-sm-4">
                            <div id= "Prix"> 50$ </div>
                            </div>
                            <div class= "col-sm-8">
                            <div id= "Qte">

                                    <button type="button" class="quantity-left-minus" onclick="moins('quantity3')" data-type="-" data-field="">-</button>

                                    <input type="text" id="quantity3" name="quantity" class="form-control input-number" value="0" min="0" max="100">


                                    <button type="button" class="quantity-right-plus" onclick="plus('quantity3')"data-type="+" data-field="">+</button>

                            </div>
                            </div>
                        </div>

                          <div class= "RentBtn">
                        <a href="#" class="btn btn-primary">Rent</a>
                          </div>
                      </div>
                    </div>
                  
            </div>
            </div>
            <div class="row">
            <div class="col-sm-4">

                    <div class="card" style="width: 18rem;">
                      <img class="card-img-top" src="images/rentalStuff/marc-babin-ecGZWPOvya0-unsplash.jpg" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">table + 12 chaises</h5>
                        <p class="card-text">Il s' agit ici d'un set d'une table en bois rectangulaire accompagnée de 12 chaises aucousin blanc et en bois </p>
                        <div class= "PrixQte">
                            <div class= "col-sm-4">
                            <div id= "Prix"> 175$ </div>
                            </div>
                            <div class= "col-sm-8">
                            <div id= "Qte">

                                    <button type="button" class="quantity-left-minus"  onclick="moins('quantity4')"data-type="-" data-field="">-</button>

                                    <input type="text" id="quantity4" name="quantity" class="form-control input-number" value="0" min="0" max="100">


                                    <button type="button" class="quantity-right-plus" onclick="plus('quantity4')"data-type="+" data-field="">+</button>

                            </div>
                            </div>
                        </div>

                          <div class= "RentBtn">
                        <a href="#" class="btn btn-primary">Rent</a>
                          </div>
                      </div>
                    </div>
                  
            </div>
             <div class="col-sm-4">

                    <div class="card" style="width: 18rem;">
                      <img class="card-img-top" src="images/rentalStuff/mel-durham-uacoWyJzDjQ-unsplash.jpg" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">table + 20 chaises</h5>
                        <p class="card-text">Il s' agit ici d'un set d'une table en bois rectangulaire accompagnée de 20 chaises brunes claires en plastique sans cousinet</p>
                        <div class= "PrixQte">
                            <div class= "col-sm-4">
                            <div id= "Prix"> 200$ </div>
                            </div>
                            <div class= "col-sm-8">
                            <div id= "Qte">

                                    <button type="button" class="quantity-left-minus"  onclick="moins('quantity5')" data-type="-" data-field="">-</button>

                                    <input type="text" id="quantity5" name="quantity" class="form-control input-number" value="0" min="0" max="100">


                                    <button type="button" class="quantity-right-plus" onclick="plus('quantity5')"data-type="+" data-field="">+</button>

                            </div>
                            </div>
                        </div>

                          <div class= "RentBtn">
                        <a href="#" class="btn btn-primary">Rent</a>
                          </div>
                      </div>
                    </div>
                  
            </div>
             <div class="col-sm-4">

                    <div class="card" style="width: 18rem;">
                      <img class="card-img-top" src="images/rentalStuff/marc-babin-aQWmCH_b3MU-unsplash.jpg" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">table+ 14 chaises</h5>
                        <p class="card-text">Il s' agit ici d'un set d'une table en bois rectangulaire accompagnée de 14 chaises au cousin blanc et en bois</p>
                        <div class= "PrixQte">
                            <div class= "col-sm-4">
                            <div id= "Prix"> 250$ </div>
                            </div>
                            <div class= "col-sm-8">
                            <div id= "Qte">

                                    <button type="button" class="quantity-left-minus" onclick="moins('quantity6')" data-type="-" data-field="">-</button>

                                    <input type="text" id="quantity6" name="quantity" class="form-control input-number" value="0" min="0" max="100">


                                    <button type="button" class="quantity-right-plus" onclick="plus('quantity6')" data-type="+" data-field="">+</button>

                            </div>
                            </div>
                        </div>

                          <div class= "RentBtn">
                        <a href="#" class="btn btn-primary">Rent</a>
                          </div>
                      </div>
                    </div>
                  
            </div>
            </div-->
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

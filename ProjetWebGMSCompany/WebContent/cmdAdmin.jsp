<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList" %>
 <%@page import="VO.*" %>
  <%@page import="DAO.*" %>
      <% ClientVO client = new ClientVO(); %>
     <% ClientDAO clDAO = new ClientDAO(); %>
     <% CommandeAProduitDAO cpDAO = new CommandeAProduitDAO(); %>
     <% ClientACommandeDAO clcDAO = new ClientACommandeDAO(); %>
     <% StatutCommandeDAO scDAO = new StatutCommandeDAO(); %>
  	  <% if(session.getAttribute("clientInfo") != null){%>
  <%client = (ClientVO)session.getAttribute("clientInfo"); %>
	<% System.out.println("clientEnCours:"+client.toString()); %>
  <% }%>
		<% ArrayList<CommandeVO>listCommande =(ArrayList)request.getAttribute("listCommande") ;%>
		  <% System.out.println(listCommande.size() + " est la TAILLE"); %>

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
    <link rel="stylesheet" type="text/css" href="css/cmdAdmin.css">
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
                <a class="nav-link" href="Accueil.html">Accueil <span class="sr-only">(current)</span></a>
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
                <a class="nav-link" href="Shop.jsp">Shop</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="ContactUs.jsp">Contact Us</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="AboutUs.jsp">About Us</a>
              </li>
              <li class="nav-item dropdown ">
               <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       
              
                   <i class="material-icons" style="color:black">account_circle</i>
                      <% out.print("Hi "+client.getPrenom() + "!"); %>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: burlywood; opacity: 0.8;">
                <a class="dropdown-item" href="cmdAdminServelet">Gestion Commandes</a>
                  <a class="dropdown-item" href="ShopServelet">Gestion des Produits</a>
                  <a class="dropdown-item" href="logoutServelet">logout</a>
             
             	</div>
              </li>
          
                <li class="nav-item">
                <a class="nav-link" href="Card.html">
                        <i class="material-icons" style="color:black">shopping_cart</i>
                    <span class='badge badge-warning' id='lblCartCount'> 1 </span>
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="container-fluid  mt-5 "style="padding: 0" >
        <div class= "row">
                      <h1> <span class="badge badge-warning" id="cmd">Gestion de Commandes</span></h1>
                </div>
        <%for(int i = 0; i < listCommande.size(); i++){ %>
        	<% CommandeVO commandeCourante = listCommande.get(i); %>
           		<%float total = cpDAO.SommeTotalCommande(commandeCourante.getId());%>
           		<% ArrayList<ProduitVO>listProduits = cpDAO.getProduitByCmdID(commandeCourante.getId()); %>
           
                
               <div class= "row">
                <table  class="table" cid="orderTbl">
                    <thead>
                      <tr>
                          <td colspan="6"><Strong>Numero De Commande : <%out.print(""+commandeCourante.getId());%> </Strong></td>
                    </tr>
                    </thead>
                    <tbody>

	                   	 <tr>
	
	                        <th colspan="1">Date</th>
	                        <th colspan="1">Heure</th>
	                        <th colspan="2">Statut</th>
	                        <th colspan="1"></th>
	                        <th colspan="1">Prix Total</th>
	                    </tr>
	                     <tr>
	                       <form action="updateCmdServelet" method="get">
	                        <td><%out.print(""+commandeCourante.getDate());%></td>
	                        <td> <%out.print(""+commandeCourante.getHeure());%></td>
	                        <td colspan="1">
	                            <%
		                    		ArrayList<StatutCommandeVO> statutList;
		                    		StatutCommandeDAO boss  =  new StatutCommandeDAO();
		                    		statutList = boss.getAll();
	                            %>
	                            <select id="selectStatut" name="statut"> 
	                            <% for(StatutCommandeVO statut : statutList ) 
		                    		{%>
	                                <option value="<%out.print(statut.getId());%>"  required><%out.print(statut.getNomStatut());%></option>
		                    		<% } %>
	                              </select>
	                        </td >
	                         
	                        <td colspan="1" >
	                                Livraison/EstimationLivraison: <input id="dateInput" type="date" name="livraison" value= "<%out.print(commandeCourante.getEstimationDateLivraison());%>" required>
	                        </td >
	                         <td colspan="1" >
	                                 <button href="#" type="submit" class="btn btn-primary" name="save" value = "<%out.print(commandeCourante.getId());%>" >save</button>
	                        </form>
	                        
	                        
	                        </td >
	                        
	                       
	                        <td><%out.print(cpDAO.SommeTotalCommande(commandeCourante.getId()));%> $</td>
							
							
	                      </tr>
	                      <%for(int j = 0 ; j < listProduits.size(); j++){ %>
	                      <% ProduitVO pCourant = listProduits.get(j); %>
	                    <tr>
	                        <td colspan="3">
	                            <img src="<%out.print(""+pCourant.getPhotoUrl());%>" alt="Card image cap" height = "100px" width="100px">
	
	                        </td>
	                        
	                        <td colspan="3">
	
	                            <ul style="list-style: none; text-align: left;">
	                                <li><Strong> Nom: </Strong> <%out.print(pCourant.getNom());%> </li>		
	                                <li> <Strong>description:</Strong> <%out.print(pCourant.getdescription());%></li>
	                                <li> <Strong>Prix: <%out.print(pCourant.getPrix());%> $</Strong></li>		
	                                <% int qte = cpDAO.getProduitACommandeBycmdID(commandeCourante.getId(),pCourant.getId()).getQteCommande(); %>
	                               
	                                <li> <Strong>qte pris: <%out.print(qte);%> </Strong></li>         
	                            </ul>
	                        </td>
	                                       
	                        </tr>
	                        <%} %>
						
                    </tbody>
                </table>
            </div>
            <%} %>

            
        </main><!-- /.container -->
    </body>

    
</html>

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
    <link rel="stylesheet" type="text/css" href="css/produitAdmin.css">
    
       <link rel="stylesheet" type="text/css" href="css/animate.css">
      <script src = "js/navbarColorChange.js"></script>
       <script src = "js/plusAndMinus.js"></script>
       <script src = "js/modalPopulation.js"></script>
          <script src = "js/modalGestions.js"></script>
          <script src = "js/addProduct.js"></script>
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
                    <%} %>
                    	
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="container-fluid  mt-5 "style="padding: 0" >
        
                
                    
                    <!-- Modal -->
            <div class="modal fade" id="InventaireForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
              aria-hidden="true">
              <div class="modal-dialog form-dark" role="document">
                <!--Content-->
                <div class="modal-content card card-image" style="background-image: url(images/debby-hudson-S66_Cr_sf-Y-unsplash.jpg);">
                  <div class="text-white rgba-stylish-strong py-5 px-5 z-depth-4">
                    <!--Header-->
                    <div class="modal-header text-center pb-4">
                      <h3 class="modal-title w-100 white-text font-weight-bold" id="myModalLabel"><strong>INVENTAIRE PRODUIT # 1</strong></h3>
                      <button type="button" class="close white-text" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <!--Body-->
                    <div class="modal-body" style="font-family: Sofia;">
                    	<form method="get" id="inventaire_form">
                      <!--Body-->
		                      <div class="md-form mb-3">
		                        <label data-error="wrong" data-success="right" for="QteEnStock">Quantit&eacute; En Stock</label>
		                        <input type="number" id="QteEnStock" class="form-control validate white-text" required>
		                        
		                      </div>
		
		                      <div class="md-form pb-3">
		                           <label data-error="wrong" data-success="right" for="SeuilMin">Seuil Minimum</label>
		                        <input type="number" id="SeuilMin" class="form-control validate white-text" required>
		                       
		                       
		                      </div>
		                        
		                        <div class="md-form mb-5">
		                        <label data-error="wrong" data-success="right" for="QteAchete">Quantit&eacute; &#192;  acheter</label>
		                        <input type="number" id="QteAchete" class="form-control validate white-text"required >
		                        
		                      </div>
		
		
		                      <!--Grid row-->
		                      <div class="row d-flex align-items-center mb-3">
		
		                        <!--Grid column-->
		                        <div class="text-center mb-3 col-md-12" id="BtnPart">
		                            <div class=" col-md-6">
		                                 <button type="submit" class="btn btn-success btn-block btn-rounded z-depth-1" id ="produitIDBtn" name = "produitIDBtn" value="0">Save</button>
		                            </div>
		                              <div class="  col-md-6">
		                                   <button type="button" class="btn btn-success btn-block btn-rounded z-depth-1" data-dismiss="modal" >Cancel</button>
		                            </div>
		                         
		                        </div>
		                        <!--Grid column-->
		
		                      </div>
		                      <!--Grid row-->
		
		                      <!--Grid row-->
		                      <div class="row">
		
		
		
		                      </div>
		                      <!--Grid row-->
						</form>
                    </div>
                  </div>
                </div>
                <!--/.Content-->
              </div>
            </div>
            <!-- Modal -->
            
            
                <!-- Modal -->
            <div class="modal fade" id="updateAddForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
              aria-hidden="true">
              <div class="modal-dialog form-dark" role="document">
                <!--Content-->
                <div class="modal-content card card-image" style="background-image: url(images/debby-hudson-S66_Cr_sf-Y-unsplash.jpg);">
                  <div class="text-white rgba-stylish-strong py-5 px-5 z-depth-4">
                    <!--Header-->
                    <div class="modal-header text-center pb-4">
                      <h3 class="modal-title w-100 white-text font-weight-bold" id="myModalLabel"><strong>MODIFICATION DU</strong> 
                          <strong> PRODUIT #1</strong></h3>
                        
                      <button type="button" class="close white-text" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <!--Body-->
                    
                    <div class="modal-body" style="font-family: Sofia;">
                      <!--Body-->
                      <form method="get" id="update_form">	
                      <div class="md-form mb-3">
                        <label data-error="wrong" data-success="right" for="ProduitName" required>Nom Du Produit</label>
                        <input type="text" id="ProduitName" class="form-control validate white-text">
                        
                      </div>
				
                      <div class="md-form pb-3">
                           <label data-error="wrong" data-success="right" for="Description" required>Description</label>
                        <input type="text" id="Description" class="form-control validate white-text">
                       
                       
                      </div>
                        <div class="md-form pb-3">
                           <label data-error="wrong" data-success="right" for="Prix" required>prix</label>
                        <input type="text" id="Prix" class="form-control validate white-text">
                       
                       
                      </div>
                        
                       <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="URL" required>UrlImage</label>
                        <input type="text" id="URL" class="form-control validate white-text">
                        
                      </div>
                        

                      <!--Grid row-->
                      <div class="row d-flex align-items-center mb-3">

                        <!--Grid column-->
                        <div class="text-center mb-3 col-md-12" id="BtnPart">
                            <div class=" col-md-6">
                                 <button type="submit" class="btn btn-success btn-block btn-rounded z-depth-1"  id ="produitIDBtn2" name ="produitIDBtn2" value="1">Save</button>
                            </div>
                              <div class="  col-md-6">
                                   <button type="button" class="btn btn-success btn-block btn-rounded z-depth-1"data-dismiss="modal" >Cancel</button>
                            </div>
                         
                        </div>
                        <!--Grid column-->

                      </div>
                      <!--Grid row-->

                      <!--Grid row-->
                      <div class="row">



                      </div>
                      <!--Grid row-->
		  		 </form>
                    </div>
                 
                  </div>
                </div>
                <!--/.Content-->
              </div>
            </div>
            <!-- Modal -->
            
                        
                <!-- Modal -->
            <div class="modal fade" id="AddForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
              aria-hidden="true">
              <div class="modal-dialog form-dark" role="document">
                <!--Content-->
                <div class="modal-content card card-image" style="background-image: url(images/debby-hudson-S66_Cr_sf-Y-unsplash.jpg);">
                  <div class="text-white rgba-stylish-strong py-5 px-5 z-depth-4">
                    <!--Header-->
                    <div class="modal-header text-center pb-4">
                      <h3 class="modal-title w-100 white-text font-weight-bold" id="myModalLabel"><strong>Ajouter Nouveau Produit</strong></h3>
                        
                      <button type="button" class="close white-text" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <!--Body-->
                    <div class="modal-body" style="font-family: Sofia;">
                    <form method="get" id="AddProduit_form">
                      <!--Body-->
                      <div class="md-form mb-3">
                        <label data-error="wrong" data-success="right" for="ProduitName">Nom Du Produit</label>
                        <input type="text" id="ProduitName2" class="form-control validate white-text"required>
                        
                      </div>

                      <div class="md-form pb-3">
                           <label data-error="wrong" data-success="right" for="Description">Description</label>
                        <input type="text" id="Description2" class="form-control validate white-text" required>
                       
                       
                      </div>
                        <div class="md-form pb-3">
                           <label data-error="wrong" data-success="right" for="Prix" >prix</label>
                        <input type="text" id="Prix2" class="form-control validate white-text"required>
                       
                       
                      </div>
                        
                        <div class="md-form mb-3">
                        <label data-error="wrong" data-success="right" for="URL" >UrlImage</label>
                        <input type="text" id="URL2" class="form-control validate white-text"required>
                        
                      </div>
                        <div class="md-form mb-3">
                        <label data-error="wrong" data-success="right" for="QteEnStock" >Quantit&eacute; En Stock</label>
                        <input type="number" id="QteEnStock2" class="form-control validate white-text"required>
                        
                      </div>

                      <div class="md-form pb-3">
                           <label data-error="wrong" data-success="right" for="SeuilMin" >Seuil Minimum</label>
                        <input type="number" id="SeuilMin2" class="form-control validate white-text"required>
                       
                       
                      </div>
                        
                        <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="QteAchete" >Quantit&eacute; &#192;  acheter</label>
                        <input type="number" id="QteAchete2" class="form-control validate white-text"required>
                        
                      </div>

                      <!--Grid row-->
                      <div class="row d-flex align-items-center mb-3">

                        <!--Grid column-->
                        <div class="text-center mb-3 col-md-12" id="BtnPart">
                            <div class=" col-md-6">
                                 <button type="submit" class="btn btn-success btn-block btn-rounded z-depth-1" >Save</button>
                            </div>
                              <div class="  col-md-6">
                                   <button type="button" class="btn btn-success btn-block btn-rounded z-depth-1" data-dismiss="modal" >Cancel</button>
                            </div>
                         
                        </div>
                        <!--Grid column-->

                      </div>
                      <!--Grid row-->

                      <!--Grid row-->
                      <div class="row">



                      </div>
                      <!--Grid row-->
						</form>
                    </div>
                  </div>
                </div>
                <!--/.Content-->
              </div>
            </div>
            <!-- Modal -->
          
                <div class= "row">
                      <h1> <span class="badge badge-warning" id="cmd">Gestion de Produits </span></h1> 
                    
                </div>
                <div class= "row" id = "AddBtn">
                                   
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#AddForm">
                                    <i class="material-icons" style="color:black">add_circle</i> ajouter Produit
                            </a>
                   
            </div>
            <% for(int i = 0 ; i < listProduits.size(); i++) { %>
            <%ProduitVO articleCourant = listProduits.get(i); %>
            <%inventaireProduitDAO invDAO = new inventaireProduitDAO(); %>
           
            <% inventaireProduitVO invProdCourant = invDAO.getInventaireByProduitId(articleCourant.getId())  ;%>
             <% System.out.println(invProdCourant.toString());%>
             <% int QteEnStock = invProdCourant.getQteEnStock();%>
             <% int SeuilMin = invProdCourant.getSeuilMinimum();%>
             <% int qteAacheter = invProdCourant.getQteAachete();%>
             <% ;%>
               <div class= "row">
                <table  class="table" cid="orderTbl">
                    <thead>
                      <tr>
                          <td colspan="7"><Strong>Matricule Du Produit: #<% out.print(articleCourant.getId());%></Strong></td>
                    </tr>
                    </thead>
                    <tbody>
                         <tr>
                            
                            <th colspan="1">image + URL</th>
                            <th colspan="1">description</th>
                            <th colspan="1">Prix</th>
                            <th colspan="3"> </th>
                           
                             
                        </tr>
                     <tr>
                         
                        <td>
                            <img src="<%out.print(articleCourant.getPhotoUrl());%>" alt="Card image cap" height = "100px" width="100px">
                         </td>
                           
                        <td style="text-align: left;"> 
                            <Strong>nom:</Strong> <% out.print(articleCourant.getNom()); %><br>
                            <Strong>description:</Strong> <%out.print(articleCourant.getdescription());  %>
                         </td>
                        <td colspan="1">
                            
                              <Strong><%out.print(articleCourant.getPrix());%>$</Strong>
                        </td >
                         
                        <td colspan="1" >
                                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#InventaireForm" data-qteEnStock= "<%out.print(invProdCourant.getQteEnStock()); %>" data-seuilMin= "<%out.print(invProdCourant.getSeuilMinimum()) ;%>" data-qteAacheter="<%out.print(invProdCourant.getQteAachete()); %>" data-produitID= "<%out.print(invProdCourant.getProduitID()); %>">inventaire</a>
                        </td >
                         <td colspan="1" >
                                   <a
                                      href="#" > <i class="material-icons" style="color:black">delete</i>
                                    </a>
                        </td >
                        <td> <a  href="#" data-toggle="modal" data-target="#updateAddForm"  data-Nom="<%out.print(articleCourant.getNom()); %>" data-description="<%out.print(articleCourant.getdescription()); %>" data-prix="<%out.print(articleCourant.getPrix()); %>"  data-urlImage="<%out.print(articleCourant.getPhotoUrl()); %> " data-produitID="<%out.print(articleCourant.getId());%>"> <i class="material-icons" style="color:black">edit</i>
                                    </a>
                         </td>
                     </tr>
                   
                </tbody>
            </table>
        </div>
        <%} %>
        
        </main><!-- /.container -->
    </body>
      
    
</html>

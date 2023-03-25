<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
 <link rel="stylesheet" type="text/css" href="css/paypal.css">
<title>PaymentPaypal</title>
</head>
<body>

<%String total = (String)request.getAttribute("total");%>

<main role="main" class="container-fluid  mt-5 "style="padding: 0" >
  <div class= "row" id="row1">
      <div class= "col-xs-5 ml-5" style="padding: 0; top: 0; left:0" >
		<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
		<input type='hidden' value="<%out.print(total);%>" name="amount" />
		<input name="currency_code" type="hidden" value="CAD" />
		<input name="shipping" type="hidden" value="0.00" />
		<input name="tax" type="hidden" value="0.00" />
		<input name="return" type="hidden" value="http://localhost:8080/ProjetWebGMSCompany/CommandeServelet" />
		<input name="cancel_return" type="hidden" value="http://localhost:8080/ProjetWebGMSCompany/Accueil.jsp" />
		<input name="notify_url" type="hidden" value="http://votredomaine/validationPaiement.php" />
		<input name="cmd" type="hidden" value="_xclick" />
		<input name="business" type="hidden" value="dalapoi@lacitec.on.ca" />
		<input name="item_name" type="hidden" value="TestAchat1" />
		<input name="no_note" type="hidden" value="1" />
		<input name="lc" type="hidden" value="FR" />
		<input name="bn" type="hidden" value="PP-BuyNowBF" />
		<input name="custom" type="hidden" value="ID_ACHETEUR" />
		<input alt="Effectuez vos paiements via PayPal : une solution rapide, gratuite et sécurisée" name="submit" src="https://www.paypal.com/fr_FR/FR/i/btn/btn_buynow_LG.gif" type="image" /><img src="https://www.paypal.com/fr_FR/i/scr/pixel.gif" border="0" alt="" width="1" height="1" />
		</form>
        </div>
      <div class= "col-xs-5 ml-5" style="padding: 0; top: 0; left:0" >

			<a class="btn btn-primary" href="creditCard.jsp" style="background-color: burlywood";>payer Par carte De Credit</a>
      </div>
    </div>
</main>
</body>
</html>
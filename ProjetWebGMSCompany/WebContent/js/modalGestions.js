 $(document).ready(function(){  
	$('#inventaire_form').on("submit", function(event){   
				var qteEnStock = $('#QteEnStock').val();
				var seuilMin = $('#SeuilMin').val();
				var qteAachete = $('#QteAchete').val();
				var produitID = $('#produitIDBtn').val();
                $.ajax({  
                     url:"updateInventaireServelet",  
                     method:"GET",  
                     data:{qteEnStock:qteEnStock,
							seuilMin:seuilMin,
							qteAachete:qteAachete,
							produitID:produitID},
                       
                     success:function(data){  
                         alert("mis a jour effectuer avec success");
                     }, 
					 error: function(jqXHR, exception){
								 alert('OOps erreur rencontre, recommencer');	
							}
                });  
           
      });  
	
		$('#update_form').on("submit", function(event){   
				var ProduitName = $('#ProduitName').val();
				var Description = $('#Description').val();
				var Prix = $('#Prix').val();
				var URL = $('#URL').val();
				var produitID = $('#produitIDBtn2').val();
                $.ajax({  
                     url:"updateProduitServelet",  
                     method:"GET",  
                     data:{ProduitName:ProduitName,
							Description:Description,
							Prix:Prix,
							produitID:produitID,
							URL:URL},
                       
                     success:function(data){  
                         alert("mis a jour effectuer avec success");
                     }, 
					 error: function(jqXHR, exception){
								 alert('OOps erreur rencontre, recommencer');	
							}
                });  
           
      });  
		
		
 
  });
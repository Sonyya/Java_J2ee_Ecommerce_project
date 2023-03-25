 $(document).ready(function(){  
	 $('#AddProduit_form').on("submit", function(event){   
			var ProduitName = $('#ProduitName2').val();
			var Description = $('#Description2').val();
			var Prix = $('#Prix2').val();
			var URL = $('#URL2').val();
			var qteEnStock = $('#QteEnStock2').val();
			var seuilMin = $('#SeuilMin2').val();
			var qteAachete = $('#QteAchete2').val();
			alert(" Description "+Description+ " Prix "+Prix+" URL "+ URL+" ProduitName "+ ProduitName)
			
         $.ajax({  
              url:"createProduitServelet",  
              method:"GET",  
              data:{ProduitName:ProduitName,
						Description:Description,
						Prix:Prix,
						URL:URL,
						qteEnStock:qteEnStock,
						seuilMin:seuilMin,
						qteAachete:qteAachete},
                
              success:function(data){  
                  alert("Produit AJoutee avec success");
              }, 
				 error: function(jqXHR, exception){
							 alert('OOps erreur rencontre, recommencer');	
						}
         });  
    
		}); 
	 
	 
 });
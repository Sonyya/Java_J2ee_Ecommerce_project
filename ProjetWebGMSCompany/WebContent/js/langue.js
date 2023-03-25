 $(document).ready(function(){  
  
		 $('#Francais').click(function () {
			 var langue;
				langue = "fr"
			    alert('francais clicked. langue = ' + langue);
	           $.ajax({  
	               url:"toggleLanguageServelet",  
	               method:"GET",  
	               data:{langue:langue},
	               success:function(data){  
	                   alert("mis a jour effectuer avec success");
	          
	               }, 
					 error: function(jqXHR, exception){
								 alert('OOps erreur rencontre, recommencer');	
							}
	          });  
			   
		 });
		 
		 $('#English').click(function () {
			 var langue;
				 langue = "en"
				alert('English clicked. langue = ' + langue);
			  
	           $.ajax({  
	               url:"toggleLanguageServelet",  
	               method:"GET",  
	               data:{langue:langue},
	               success:function(data){  
	                   alert("mis a jour effectuer avec success");
	               }, 
					 error: function(jqXHR, exception){
								 alert('OOps erreur rencontre, recommencer');	
					}
	          });  
			   
		 });

 });
 
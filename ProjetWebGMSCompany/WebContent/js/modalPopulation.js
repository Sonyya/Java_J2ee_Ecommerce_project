
$(document).ready(function(){
	$('#InventaireForm').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var qteEnStock = button.attr('data-qteEnStock')
		  var seuilMin = button.attr('data-seuilMin')
		  var qteAachete = button.attr('data-qteAacheter')	
		  var produitID = button.attr('data-produitID')// Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('#produitIDBtn').val(produitID)
		  modal.find('.modal-title').text('Inventaire Du produit #' + produitID)
		  modal.find('#QteEnStock').val(qteEnStock)
		  modal.find('#SeuilMin').val(seuilMin)
		  modal.find('#QteAchete').val(qteAachete)

	})
	
		$('#updateAddForm').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		   // Extract info from data-* attributes
		   
		  var nom = button.attr('data-Nom')
		  var description = button.attr('data-description')
		  var prix = button.attr('data-prix')
		  var url = button.attr('data-urlImage')
		  var produitID = button.attr('data-produitID')
		 
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('#produitIDBtn2').val(produitID)
		  alert("" +modal.find('#produitIDBtn2').val(produitID))
		  modal.find('.modal-title').text('Modification \n Du produit #' + produitID)
		  modal.find('#ProduitName').val(nom)
		  modal.find('#Description').val(description)
		  modal.find('#Prix').val(prix)
		  modal.find('#URL').val(url)

	})


	
});
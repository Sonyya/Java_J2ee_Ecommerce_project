
$(document).ready(function() {
  $(window).scroll(function() {
    if ($(document).scrollTop() > 50) 
	{
		$("nav").css("background-color","burlywood");
		$("nav").css("opacity","0.9");
	} else 
	{
		$("nav").css("background-color","transparent");
		
	}
  });
});
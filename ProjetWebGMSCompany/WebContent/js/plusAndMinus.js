function plus(x) {
    var qte = parseInt(document.getElementById(x).value);
     document.getElementById(x).value = qte+1 ;
   
}
function moins(x) {
    var qte = parseInt(document.getElementById(x).value);
    if(qte>=1)
    {
     document.getElementById(x).value = qte-1 ;
	}
    else
    {
    	document.getElementById(x).value = 0 ;
    }
     
}


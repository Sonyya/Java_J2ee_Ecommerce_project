function doSubmit1() 
{
	 var val = document.getElementById('NumeroCarte').value; //assign password to a variable
	 var rkEncryptionKey = CryptoJS.enc.Base64.parse('u/Gu5posvwDsXUnV5Zaq4g==');
	 var rkEncryptionIv = CryptoJS.enc.Base64.parse('5D9r9ZVzEYYgha93/aUK2w==');
	 var utf8Stringified = CryptoJS.enc.Utf8.parse(val);
	 var encrypted = CryptoJS.AES.encrypt(utf8Stringified.toString(), rkEncryptionKey, 
	{mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7, iv: rkEncryptionIv});
	 document.creditCardForm.NumeroCarte.value = encrypted.ciphertext.toString(CryptoJS.enc.Base64);
	alert("Encrypted Password "+document.creditCardForm.NumeroCarte.value);

}

function doSubmit2() 
{
	 var val = document.getElementById('dateExpi').value; //assign password to a variable
	 var rkEncryptionKey = CryptoJS.enc.Base64.parse('u/Gu5posvwDsXUnV5Zaq4g==');
	 var rkEncryptionIv = CryptoJS.enc.Base64.parse('5D9r9ZVzEYYgha93/aUK2w==');
	 var utf8Stringified = CryptoJS.enc.Utf8.parse(val);
	 var encrypted = CryptoJS.AES.encrypt(utf8Stringified.toString(), rkEncryptionKey, 
	{mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7, iv: rkEncryptionIv});
	 document.creditCardForm.dateExpi.value = encrypted.ciphertext.toString(CryptoJS.enc.Base64);
	alert("Encrypted Password "+document.creditCardForm.dateExpi.value);

}

function doSubmit3() 
{
	 var val = document.getElementById('cvc').value; //assign password to a variable
	 var rkEncryptionKey = CryptoJS.enc.Base64.parse('u/Gu5posvwDsXUnV5Zaq4g==');
	 var rkEncryptionIv = CryptoJS.enc.Base64.parse('5D9r9ZVzEYYgha93/aUK2w==');
	 var utf8Stringified = CryptoJS.enc.Utf8.parse(val);
	 var encrypted = CryptoJS.AES.encrypt(utf8Stringified.toString(), rkEncryptionKey, 
	{mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7, iv: rkEncryptionIv});
	 document.creditCardForm.cvc.value = encrypted.ciphertext.toString(CryptoJS.enc.Base64);
	alert("Encrypted Password "+document.creditCardForm.cvc.value);

}

function doSubmit4() 
{
	 var val = document.getElementById('nom').value; //assign password to a variable
	 var rkEncryptionKey = CryptoJS.enc.Base64.parse('u/Gu5posvwDsXUnV5Zaq4g==');
	 var rkEncryptionIv = CryptoJS.enc.Base64.parse('5D9r9ZVzEYYgha93/aUK2w==');
	 var utf8Stringified = CryptoJS.enc.Utf8.parse(val);
	 var encrypted = CryptoJS.AES.encrypt(utf8Stringified.toString(), rkEncryptionKey, 
	{mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7, iv: rkEncryptionIv});
	 document.creditCardForm.nom.value = encrypted.ciphertext.toString(CryptoJS.enc.Base64);
	alert("Encrypted Password "+document.creditCardForm.nom.value);

}

function doSubmit() 
{
	 
	doSubmit1() ;
	doSubmit2() ;
	doSubmit3() ;
	doSubmit4() ;
}

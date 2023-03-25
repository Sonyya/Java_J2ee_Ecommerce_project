function doSubmit1() 
{
	 var val = document.getElementById('InputPassword').value; //assign password to a variable
	 var rkEncryptionKey = CryptoJS.enc.Base64.parse('u/Gu5posvwDsXUnV5Zaq4g==');
	 var rkEncryptionIv = CryptoJS.enc.Base64.parse('5D9r9ZVzEYYgha93/aUK2w==');
	 var utf8Stringified = CryptoJS.enc.Utf8.parse(val);
	 var encrypted = CryptoJS.AES.encrypt(utf8Stringified.toString(), rkEncryptionKey, 
	{mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7, iv: rkEncryptionIv});
	 document.formIncription.InputPassword.value = encrypted.ciphertext.toString(CryptoJS.enc.Base64);
	alert("Encrypted Password "+document.formIncription.InputPassword.value);

}

function doSubmit2() 
{
	
	 var val = document.getElementById('InputPassword2').value; //assign password to a variable
	 var rkEncryptionKey = CryptoJS.enc.Base64.parse('u/Gu5posvwDsXUnV5Zaq4g==');
	 var rkEncryptionIv = CryptoJS.enc.Base64.parse('5D9r9ZVzEYYgha93/aUK2w==');
	 var utf8Stringified = CryptoJS.enc.Utf8.parse(val);
	 var encrypted = CryptoJS.AES.encrypt(utf8Stringified.toString(), rkEncryptionKey, 
	{mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7, iv: rkEncryptionIv});
	 document.formIncription.InputPassword2.value = encrypted.ciphertext.toString(CryptoJS.enc.Base64);
	alert("Encrypted Password2 "+document.formIncription.InputPassword2.value);
	 form.submit();
}

function doSubmit() {
	doSubmit1(); // calling function fun1()
	doSubmit2(); // calling function fun2()
	}
	 
function doSubmit() 
{
 var val = document.getElementById('InputPassword').value; //assign password to a variable
 var rkEncryptionKey = CryptoJS.enc.Base64.parse('u/Gu5posvwDsXUnV5Zaq4g==');
 var rkEncryptionIv = CryptoJS.enc.Base64.parse('5D9r9ZVzEYYgha93/aUK2w==');
 var utf8Stringified = CryptoJS.enc.Utf8.parse(val);
 var encrypted = CryptoJS.AES.encrypt(utf8Stringified.toString(), rkEncryptionKey, 
{mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7, iv: rkEncryptionIv});
 document.login_form.InputPassword.value = encrypted.ciphertext.toString(CryptoJS.enc.Base64);
alert("Encrypted Password "+document.login_form.InputPassword.value);
 form.submit();
}



function doSubmitCreditCard() 
{
 var val = document.getElementById('InputPassword').value; //assign password to a variable
 var rkEncryptionKey = CryptoJS.enc.Base64.parse('u/Gu5posvwDsXUnV5Zaq4g==');
 var rkEncryptionIv = CryptoJS.enc.Base64.parse('5D9r9ZVzEYYgha93/aUK2w==');
 var utf8Stringified = CryptoJS.enc.Utf8.parse(val);
 var encrypted = CryptoJS.AES.encrypt(utf8Stringified.toString(), rkEncryptionKey, 
{mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7, iv: rkEncryptionIv});
 document.login_form.InputPassword.value = encrypted.ciphertext.toString(CryptoJS.enc.Base64);
alert("Encrypted Password"+document.login_form.InputPassword.value);
 form.submit();
}
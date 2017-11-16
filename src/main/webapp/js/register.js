$(function() {
	
	var reg = new registerForm(
			$("#register-form"),
			$("#txt_user_login"),
			$("#txt_user_password"),
			$("#txt_user_password_repeat")
	);
	
	reg.getForm().submit(function(event) {
		event.preventDefault();
		MessageUtil.reset();
		if (reg.isFilled()) {
			if (reg.isSamePassword()) {
				reg.sendAjax();
			} else {
				MessageUtil.show('warning','<strong>Attention! </strong>Les deux mots de passe ne sont pas identiques');
			}
		} else {
			MessageUtil.show('warning','<strong>Attention! </strong>Vous devez remplir tous les champs');
		}
	});
	
});
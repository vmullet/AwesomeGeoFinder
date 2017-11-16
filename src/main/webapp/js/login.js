$(function() {
	var log = new loginForm($("#login-form"),
			$("#txt_user_login"),
			$("#txt_user_password"),
			$("#chk_remember"));
	
	checkSessionStorage();
	checkRedirect();

	log.getForm().submit(function(event) {
				event.preventDefault();
				MessageUtil.reset();
				if (log.isFilled()) {
					log.sendAjax();
				} else {
					MessageUtil.show('warning','<strong>Attention! </strong>Vous devez remplir tous les champs');
				}
			});
});

function checkSessionStorage() {
	if (sessionStorage != null) {
		var storedUsername = localStorage.getItem('agf.current_username');
		if (storedUsername != null) {
			$('#txt_user_login').val(storedUsername);
		}
	}
}

function checkRedirect() {
	if (location.search == '?register-success') {
		MessageUtil.show('success','<strong>Félicitations! </strong>Utilisateur créé avec succès');
	}
	if (location.search == '?not-logged') {
		MessageUtil.show('danger','<strong>Attention! </strong>Vous devez être connecté pour jouer');
	}
}
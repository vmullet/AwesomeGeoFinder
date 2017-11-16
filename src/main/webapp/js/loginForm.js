function loginForm(form,input_username,input_password,input_remember) {
	this.form = form;
	this.input_username = input_username;
	this.input_password = input_password;
	this.input_remember = input_remember;
}

loginForm.prototype.getUsername = function() {
	return this.input_username.val();
};

loginForm.prototype.getPassword = function() {
	return this.input_password.val();
};

loginForm.prototype.getForm = function() {
	return this.form;
};

loginForm.prototype.isRemembered = function() {
	return this.input_remember.is(':checked');
};

loginForm.prototype.reset = function() {
	this.input_username.val('');
	this.input_password.val('');
	this.input_remember.attr(':checked',false);
};

loginForm.prototype.isFilled = function() {
	return this.input_username.val() != '' && this.input_password.val() != '';
}

loginForm.prototype.getAction = function() {
	return this.form.attr('action');
}

loginForm.prototype.sendAjax = function() {
	var formData = this.form.serializeArray();
	$.ajax({
			type : 'POST',
			url : this.form.attr('action'),
			dataType : 'json',
			data : formData,
			contentType : "application/x-www-form-urlencoded"
			})
			.done(
				function(response) {
					if (response['id'] != null) {
						MessageUtil.show('success','<strong>Félicitations! </strong>Connexion effectuée avec succès');
						if ($('#chk_remember').is(':checked')) {
							localStorage.setItem('agf.current_username',response['login']);
						} else {
							localStorage.removeItem('agf.current_username');
						}
						sessionStorage.setItem('agf.current_username',response['login']);
						sessionStorage.setItem('agf.current_id',response['id']);
						location.href='game.html';
					} else {
						MessageUtil.show('danger','<strong>Erreur! </strong>Login ou mot de passe invalide');
				}
			});
}
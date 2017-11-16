function registerForm(form,input_username,input_password,input_password_repeat) {
	this.form = form;
	this.input_username = input_username;
	this.input_password = input_password;
	this.input_password_repeat = input_password_repeat;
}

registerForm.prototype.getForm = function() {
	return this.form;
}

registerForm.prototype.getUsername = function() {
	return this.input_username.val();
}

registerForm.prototype.getPassword = function() {
	return this.input_password.val();
}

registerForm.prototype.getPasswordRepeat = function() {
	return this.input_password_repeat.val();
}

registerForm.prototype.isFilled = function() {
	return this.input_username.val() != '' 
		&& this.input_password.val() != ''
		&& this.input_password_repeat.val() != '';
		
}

registerForm.prototype.isSamePassword = function() {
	return this.input_password.val()
		== this.input_password_repeat.val();
		
}

registerForm.prototype.getAction = function() {
	return this.form.attr('action');
}

registerForm.prototype.sendAjax = function() {
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
						location.href='login.html?register-success';
					} else {
						MessageUtil.show('danger','<strong>Erreur! </strong>Problème lors de l inscription');
				}
			});
}
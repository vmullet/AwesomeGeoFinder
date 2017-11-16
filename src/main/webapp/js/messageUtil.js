function MessageUtil() {}

MessageUtil.show = function(msg_class,msg_text) {
	var container = $("#form-messages");
	container.addClass('alert alert-' + msg_class);
	container.html(msg_text);
}

MessageUtil.reset = function() {
	var container = $("#form-messages");
	container.removeClass('alert alert-danger alert-warning alert-success');
	container.html('');
}

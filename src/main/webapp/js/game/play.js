$(function() {

	$(document).ajaxSend(function(event, jqxhr, settings){
		$.LoadingOverlay("show", {
		    image       : "",
		    fontawesome : "fa fa-spinner fa-spin"
		});
	});
	$(document).ajaxComplete(function(event, jqxhr, settings){
	    $.LoadingOverlay("hide");
	});
	
	if (sessionStorage.getItem('agf.current_id') != null) {
		$("#player_login").text(sessionStorage.getItem('agf.current_username'));
		var txtCity = $("#chosen_city");
		var txtTurn = $("#current_turn");
		var txtScore = $("#current_score");
		var txtHelp = $("#current_help");
		var btnNextCity = $("#btn_next_city");
		var btnHelp = $("#btn_help");
		var btnResults = $("#btn_results");
		var btnReplay = $("#btn_replay");
		btnResults.hide();
		btnReplay.hide();
		var map = new agfMap(L.map("mapid"));
		var agfGame = new game(map,txtCity,txtTurn,txtScore,txtHelp,btnNextCity,btnHelp,btnResults,btnReplay);
		agfGame.initGame();
		agfGame.startGame();
		map.mapObj.on('dblclick',function(e) {
			if (!agfGame.isFinished) {
				map.addMarker(e.latlng);
				map.drawLine(e.latlng,agfGame.getCurrentCity().getLatLng());
				var distance = parseInt(map.getDistance(e.latlng,agfGame.getCurrentCity().getLatLng())/1000);
				agfGame.setScore(distance);
			}
		});
		
		$("#btn_next_city").on('click',function() {
			if (!agfGame.isFinished) {
				if (agfGame.turnScore != -1) {
					agfGame.saveTurn();
				} else {
					alert('Veuillez jouer');
				}
			}
		});
		
		$("#btn_help").on('click',function() {
			if (!agfGame.isFinished) {
				if (agfGame.turnScore == -1) {
					agfGame.getHelp();
				} else {
					alert('Vous avez déjà joué,passez à la prochaine ville');
				}
			}
		});
		
		$("#btn_results").on('click',function() {
			agfGame.showResults();
		});
		
		
	} else {
		location.href = "login.html?not-logged"
	}
	
});

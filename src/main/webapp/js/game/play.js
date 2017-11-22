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
		var btnQuit = $("#btn_quit");
		var btnReplay = $("#btn_replay");
		var btnConfirmMarker = $("#btn_confirm_marker");
		var btnRemoveMarker = $("#btn_remove_marker");
		var selectedCoordinate = null;
		var map = new agfMap(L.map("mapid"));
		var agfGame = new game(map,txtCity,txtTurn,txtScore,txtHelp,btnNextCity,btnHelp,btnResults,btnReplay,btnQuit,btnConfirmMarker,btnRemoveMarker);
		agfGame.initGame();
		agfGame.startGame();
		map.mapObj.on('dblclick',function(e) {
			if (!agfGame.isFinished) {
				if (selectedCoordinate == null) {
					selectedCoordinate = e;
					map.addMarker(selectedCoordinate.latlng);
					agfGame.setConfirmMode(true);
				} else {
					MessageUtil.showPopup("Avertissement","Vous avez déjà placé un marqueur");
				}
			} else {
				MessageUtil.showPopup("Avertissement","La partie est déjà terminée");
			}
		});
		
		btnConfirmMarker.on('click',function() {
			if (selectedCoordinate != null) {
				agfGame.showAnswer();
				map.drawLine(selectedCoordinate.latlng,agfGame.getCurrentCity().getLatLng());
				var distance = parseInt(map.getDistance(selectedCoordinate.latlng,agfGame.getCurrentCity().getLatLng())/1000);
				agfGame.setScore(distance);
				agfGame.setConfirmMode(false);
				btnNextCity.show();
				selectedCoordinate = null;
			} else {
				MessageUtil.showPopup("Avertissement","Veuillez sélectionner un emplacement sur la carte");
			}
			
		});
		
		btnRemoveMarker.on('click',function() {
			if (selectedCoordinate != null) {
				var remove = L.marker(selectedCoordinate.latlng);
				map.removeMarker(remove);
				selectedCoordinate = null;
				agfGame.setConfirmMode(false);
			} else {
				MessageUtil.showPopup("Avertissement","Aucun marqueur à supprimer");
			}
		});
		
		btnNextCity.on('click',function() {
			if (!agfGame.isFinished) {
				if (agfGame.turnScore != -1) {
					agfGame.saveTurn();
				} else {
					MessageUtil.showPopup('Avertissement','Veuillez jouer');
				}
			}
		});
		
		btnHelp.on('click',function() {
			if (!agfGame.isFinished) {
				if (agfGame.turnScore == -1) {
					agfGame.getHelp();
				} else {
					MessageUtil.showPopup('Avertissement','Vous avez déjà joué,passez à la prochaine ville');
				}
			}
		});
		
		btnResults.on('click',function() {
			agfGame.showResults();
		});
		
		btnQuit.on('click',function() {
			
			$.confirm({
			    title: 'Quitter le jeu',
			    content: 'Etes-vous sûr ? Cette action est irréversible',
			    buttons: {
			        Oui: function () {
			            location.href = "index.html";
			        },
			        Non: function () {}
			    }
			});
			
		});
		
		
	} else {
		location.href = "login.html?not-logged"
	}
	
});

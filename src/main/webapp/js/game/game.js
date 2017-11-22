function game(map,
		txtCity,
		txtTurn,
		txtScore,
		txtHelp,
		btnNextCity,
		btnHelp,
		btnResults,
		btnReplay,
		btnQuit,
		btnConfirmMarker,
		btnRemoveMarker) 
{
	this.mymap = map;
	this.capitals = new Array();
	this.cityIndex = -1;
	this.turnValue = 0;
	this.turnScore = -1;
	this.turnScoreMultiplier = 1;
	this.turnHelp = false;
	this.counterHelp = 2;
	this.totalScore = 0;
	this.isFinished = false;
	this.txtCity = txtCity;
	this.txtTurn = txtTurn;
	this.txtScore = txtScore;
	this.txtHelp = txtHelp;
	this.btnNextCity = btnNextCity;
	this.btnHelp = btnHelp;
	this.btnResults = btnResults;
	this.btnReplay = btnReplay;
	this.btnQuit = btnQuit;
	this.btnConfirmMarker = btnConfirmMarker;
	this.btnRemoveMarker = btnRemoveMarker;
	
	this.nextCity = function() {
		this.cityIndex++;
		this.txtCity.text(this.capitals[this.cityIndex].name);
		//this.mymap.showCapital(this.capitals[this.cityIndex]);
	}
	
	
}

game.prototype.initGame = function() {
	this.txtHelp.text(this.counterHelp);
	this.btnNextCity.hide();
	this.btnResults.hide();
	this.btnReplay.hide();
	this.btnConfirmMarker.hide();
	this.btnRemoveMarker.hide();
}

game.prototype.startGame = function() {
	var self = this;
	var mydata = {"id": sessionStorage.getItem("agf.current_id")};
	$.ajax({
		type : 'POST',
		url : 'rest/game',
		contentType : 'application/json',
		dataType : 'json',
		data : JSON.stringify(mydata)
		})
		.done(function(response) {
			if (response['id'] != null) {
				sessionStorage.setItem('agf.gameId',response['id']);
				self.mymap.init();
				self.loadRandomCapitals();
			} else {
				MessageUtil.showPopup("Erreur","Problème lors de la création de la partie");
				location.href = "index.html";
			}
		});
	
}

game.prototype.getHelp = function() {
	if (this.counterHelp > 0) {
		this.counterHelp--;
		this.turnHelp = true;
		this.txtHelp.text(this.counterHelp);
		switch(this.counterHelp) {
			case 1:
				this.turnScoreMultiplier++;
				this.txtCity.append(' --> ' + this.capitals[this.cityIndex].continent);
				break;
			case 0:
				this.turnScoreMultiplier++;
				this.txtCity.append(' --> ' + this.capitals[this.cityIndex].country);
				break;
			default:
				break;
		}
	} else {
		MessageUtil.showPopup("Avertissement","Vous ne pouvez plus bénéficier de l'aide");
	}
	
}

game.prototype.setScore = function(score) {
	if (this.turnScore == -1) {
		this.turnScore = score*this.turnScoreMultiplier;
		this.totalScore += this.turnScore;
		this.txtScore.text(this.turnScore + ' km');
	}
}

game.prototype.showAnswer = function() {
	this.mymap.addCapitalMarker(this.capitals[this.cityIndex]);
}

game.prototype.nextTurn = function() {
	this.turnScore = -1;
	this.turnScoreMultiplier = 1;
	this.turnHelp = false;
	this.txtScore.text('');
	this.btnNextCity.hide();
	this.mymap.removeMarkers();
	if (this.turnValue < 10) {
		this.turnValue++;
		this.txtTurn.text(this.turnValue);
		this.mymap.showWorld();
		this.nextCity();
	} else {
		this.endGame();
	}
	
}

game.prototype.endGame = function() {
	this.txtCity.text('Fin de la partie');
	this.txtScore.text(this.totalScore + ' km');
	this.mymap.showWorld();
	this.btnNextCity.hide();
	this.btnHelp.hide();
	this.btnResults.show();
	this.btnReplay.show();
	this.isFinished = true;
	
}

game.prototype.getCurrentCity = function() {
	return this.capitals[this.cityIndex];
}

game.prototype.setConfirmMode = function(enable) {
	if (enable) {
		this.btnConfirmMarker.show();
		this.btnRemoveMarker.show();
	} else {
		this.btnConfirmMarker.hide();
		this.btnRemoveMarker.hide();
	}
	
}

game.prototype.loadRandomCapitals = function() {
	var self = this;
	$.ajax({
		type : 'GET',
		url : 'rest/capital/random'
		})
		.done(function(response) {
			if (response.length > 0) {
				for (var i = 0 ; i < response.length ; i++) {
					self.capitals[i] = new capital(response[i]['id'],
							response[i]['capitalName'],
							response[i]['countryName'],
							response[i]['continentName'],
							response[i]['latitude'],
							response[i]['longitude']);
					
				}
				self.nextTurn();
			}
		});
	
}

game.prototype.saveTurn = function() {
	var self = this;
	var data = {
			"score" : self.turnScore,
			"help" : self.turnHelp,
			"game" : {
				"id" : sessionStorage.getItem('agf.gameId')
			},
			"city" : {
				"id" : self.capitals[self.cityIndex].id
			}
	};
	$.ajax({
		type : 'POST',
		url : 'rest/turn',
		dataType : 'json',
		contentType : "application/json",
		data : JSON.stringify(data)
		})
		.done(function(response) {
			if (response['id'] != null) {
				self.nextTurn();
			}
		});
	
}

game.prototype.showResults = function() {
	var game = this;
	var content = '';
	var totalScore = 0;
	$.dialog({
		columnClass: 'medium',
		closeIcon:true,
	    content: function () {
	        var self = this;
	        return $.ajax({
	            url: 'rest/turn/all/' + sessionStorage.getItem('agf.gameId'),
	            contentType: 'application/json',
	            method: 'get'
	        }).done(function (response) {
	        	self.setTitle("Résultats - Joueur : " + sessionStorage.getItem('agf.current_username'));
	            content += "<table class='table table-striped'><thead><tr><th>Tour n°</th><th>Ville</th><th>Score</th><th>Aide ?</th></tr></thead>";
	            content+='<tbody>';
	            for (var i = 0 ; i < response.length ; i++) {
	            	totalScore += response[i]['score'];
	            	var line = '<tr>';
	            	line+='<td>'+(i+1)+'</td>';
	            	line+='<td>'+response[i]['city']['capitalName']+'</td>';
	            	line+='<td>'+response[i]['score']+'</td>';
	            	if (response[i]['help']) {
	            		line+="<td><input type='checkbox' name='help' checked disabled /></td>";
	            	} else {
	            		line+="<td><input type='checkbox' name='help' disabled /></td>";
	            	}
	            	line+='</tr>';
	            	content += line;
	            }
	            content += "</table>";
	            content += "<h3 style='text-align:right;'>Score Total : <strong>"+ totalScore +" km</strong></h3>";
	            self.setContent(content);
	        }).fail(function(){
	            self.setContent('Erreur lors du chargement des résultats');
	        });
	    }
	});
}



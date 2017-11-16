function agfMap(map) {
	this.mapObj = map;
	this.markers = new Array();
}

agfMap.prototype.init = function() {
	this.mapObj.fitWorld().setZoom(2);
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
    	maxZoom: 18,
    	id: 'mapbox.streets'
    }).addTo(this.mapObj);
    this.mapObj.doubleClickZoom.disable();
}

agfMap.prototype.addMarker = function(coord) {
	var marker = L.marker(coord).addTo(this.mapObj);
	marker.bindPopup("<b>Coordinates : </b><br>" + coord).openPopup();
	this.markers.push(marker);
	
}

agfMap.prototype.showCapital = function(capital) {
	var marker = L.marker(capital.getLatLng()).addTo(this.mapObj);
	marker.bindPopup("<b>City : </b>" + capital.name + "<br><b>Country : </b> " + capital.country).openPopup();
	this.markers.push(marker);
	this.mapObj.setView(capital.getLatLng()).setZoom(5);
	
}

agfMap.prototype.showWorld = function() {
	this.mapObj.fitWorld().setZoom(2);
}

agfMap.prototype.removeMarkers = function() {
	for (var i = 0 ; i < this.markers.length ; i++) {
		this.mapObj.removeLayer(this.markers[i]);
	}
}

agfMap.prototype.drawLine = function(coord1,coord2) {
	var latlngs = [coord1,coord2];
	var polyline = L.polyline(latlngs, {color: 'red'}).addTo(this.mapObj);
	polyline.bindPopup("<b>Distance : </b>" + parseInt(this.getDistance(coord1,coord2)/1000) + " km").openPopup();
	this.mapObj.fitBounds(polyline.getBounds());
	this.markers.push(polyline);
}

agfMap.prototype.getDistance = function(coord1,coord2) {
	return coord1.distanceTo(coord2);
}


function capital(id,name,country,continent,latitude,longitude) {
	this.id = id;
	this.name = name;
	this.country = country;
	this.continent = continent;
	this.latitude = latitude;
	this.longitude = longitude;
}


capital.prototype.getLatLng = function() {
	return L.latLng(this.latitude,this.longitude);
}
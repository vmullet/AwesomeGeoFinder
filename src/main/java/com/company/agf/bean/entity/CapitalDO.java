package com.company.agf.bean.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_capital")
public class CapitalDO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "c_id")
	private Long id;
	
	@Column(name = "c_countryName", nullable = false)
	private String countryName;
	
	@Column(name = "c_capitalName", nullable = false)
	private String capitalName;
	
	@Column(name = "c_longitude", nullable = false)
	private float longitude;
	
	@Column(name = "c_latitude", nullable = false)
	private float latitude;
	
	@Column(name = "c_countryCode", nullable = true)
	private String countryCode;
	
	@Column(name = "c_continentName", nullable = false)
	private String continentName;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getCapitalName() {
		return capitalName;
	}
	public void setCapitalName(String capitalName) {
		this.capitalName = capitalName;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getContinentName() {
		return continentName;
	}
	public void setContinentName(String continentName) {
		this.continentName = continentName;
	}
	
	
	
}

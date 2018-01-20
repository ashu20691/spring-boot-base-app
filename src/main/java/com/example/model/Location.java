package com.example.model;

import javax.persistence.*;

@Entity
@Table(name = "location")
public class Location {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name="lat")
	private String lat;

	@Column(name="lng")
	private String lng;

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}


}

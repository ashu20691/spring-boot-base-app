package com.example.model;

import javax.persistence.*;

@Entity
@Table(name = "location")
public class Location {

    public Location() {
    }


    public Location(Double lat, Double lng, String program, String geographic, String projectPartner) {
        this.lat = lat;
        this.lng = lng;
        this.program = program;
        this.geographic = geographic;
        this.projectPartner = projectPartner;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "lat")
    private Double lat;

    @Column(name = "lng")
    private Double lng;

    @Column(name = "program")
    private String program;

    @Column(name = "geographic")
    private String geographic;

    @Column(name = "project_partner")
    private String projectPartner;


    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }

    public String getGeographic() {
        return geographic;
    }

    public void setGeographic(String geographic) {
        this.geographic = geographic;
    }

    public String getProjectPartner() {
        return projectPartner;
    }

    public void setProjectPartner(String projectPartner) {
        this.projectPartner = projectPartner;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


}

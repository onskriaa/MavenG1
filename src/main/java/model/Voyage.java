package model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
public class Voyage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String nomTrain;
    private String destination;
    private int placesDisponibles;

    public int getPlacesDisponibles() {
        return placesDisponibles;
    }

    public void setPlacesDisponibles(int placesDisponibles) {
        this.placesDisponibles = placesDisponibles;
    }

    @Temporal(TemporalType.DATE)
    private Date dateVoyage;

    private double prix;

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNomTrain() { return nomTrain; }
    public void setNomTrain(String nomTrain) { this.nomTrain = nomTrain; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public Date getDateVoyage() { return dateVoyage; }
    public void setDateVoyage(Date dateVoyage) { this.dateVoyage = dateVoyage; }

    public double getPrix() { return prix; }
    public void setPrix(double prix) { this.prix = prix; }
}

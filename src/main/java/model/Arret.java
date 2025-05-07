package model;

import jakarta.persistence.*;

@Entity
@Table(name = "arret")
public class Arret {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String nomGare;
    private int dureeArret;
    private String heureArret;

    @ManyToOne
    @JoinColumn(name = "trajet_id")
    private Trajet trajet;

    public Arret() {}

    public Arret(String nomGare, int dureeArret, String heureArret, Trajet trajet) {
        this.nomGare = nomGare;
        this.dureeArret = dureeArret;
        this.heureArret = heureArret;
        this.trajet = trajet;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getNomGare() {
        return nomGare;
    }

    public int getDureeArret() {
        return dureeArret;
    }

    public String getHeureArret() {
        return heureArret;
    }

    public Trajet getTrajet() {
        return trajet;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setNomGare(String nomGare) {
        this.nomGare = nomGare;
    }

    public void setDureeArret(int dureeArret) {
        this.dureeArret = dureeArret;
    }

    public void setHeureArret(String heureArret) {
        this.heureArret = heureArret;
    }

    public void setTrajet(Trajet trajet) {
        this.trajet = trajet;
    }
}

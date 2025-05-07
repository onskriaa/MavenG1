package model;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "trajet")
public class Trajet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "gare_depart", nullable = false)
    private String gareDepart;

    @Column(name = "gare_arrivee", nullable = false)
    private String gareArrivee;

    @Column(nullable = false)
    private int duree; // en minutes

    @Column(nullable = false)
    private double prix; // en euros

    @Column(name = "dateDepart")
    private String dateDepart;

    @Column(name = "heureDepart")
    private String heureDepart;

    @Column(name = "heureArrivee")
    private String heureArrivee;


    @OneToMany(mappedBy = "trajet", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Arret> arrets = new ArrayList<>();

    public Trajet() {}

    public Trajet(String gareDepart, String gareArrivee, int duree, double prix , String dateDepart, String heureDepart, String heureArrivee) {
        this.gareDepart = gareDepart;
        this.gareArrivee = gareArrivee;
        this.duree = duree;
        this.prix = prix;
        this.dateDepart = dateDepart;
        this.heureDepart = heureDepart;
        this.heureArrivee = heureArrivee;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getGareDepart() { return gareDepart; }
    public void setGareDepart(String gareDepart) { this.gareDepart = gareDepart; }

    public String getGareArrivee() { return gareArrivee; }
    public void setGareArrivee(String gareArrivee) { this.gareArrivee = gareArrivee; }

    public int getDuree() { return duree; }
    public void setDuree(int duree) { this.duree = duree; }

    public double getPrix() { return prix; }
    public void setPrix(double prix) { this.prix = prix; }

    public String getDateDepart() { return dateDepart; }
    public void setDateDepart(String dateDepart) { this.dateDepart = dateDepart; }

    public String getHeureDepart() { return heureDepart; }
    public void setHeureDepart(String heureDepart) { this.heureDepart = heureDepart; }

    public String getHeureArrivee() { return heureArrivee; }
    public void setHeureArrivee(String heureArrivee) { this.heureArrivee = heureArrivee; }

    public List<Arret> getArrets() {
        return arrets;
    }

    public void setArrets(List<Arret> arrets) {
        this.arrets = arrets;
    }
}

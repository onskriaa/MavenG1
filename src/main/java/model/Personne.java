package model;
 import jakarta.persistence.*;
 
 @Entity
 @Table(name = "Personne")
 public class Personne {
 @Id @GeneratedValue
 @Column(name = "id")
 private int id;
 @Column(name = "cin")
 private String cin;
 @Column(name = "nom")
 private String nom;
 @Column(name = "prenom")
 private String prenom;
 //Constructeur sans paramètres 
public Personne() {
	super();
	// TODO Auto-generated constructor stub
}

//Constructeur avec paramètres (cin,nom,prenom)
public Personne( String cin, String nom, String prenom) {
	super();
	this.cin = cin;
	this.nom = nom;
	this.prenom = prenom;
}

//Ajouter les getters et les setters
public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getCin() {
	return cin;
}

public void setCin(String cin) {
	this.cin = cin;
}

public String getNom() {
	return nom;
}

public void setNom(String nom) {
	this.nom = nom;
}

public String getPrenom() {
	return prenom;
}

public void setPrenom(String prenom) {
	this.prenom = prenom;
}
 



 }  
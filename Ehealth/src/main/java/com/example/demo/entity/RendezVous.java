package com.example.demo.entity;


import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
public class RendezVous {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate date;
    private LocalTime heure;
    private String description;
    private String statut;

    public RendezVous() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "RendezVous [id=" + id + ", date=" + date + ", heure=" + heure + ", description=" + description
				+ ", statut=" + statut + ", patient=" + patient + ", medecin=" + medecin + "]";
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public RendezVous(Long id, LocalDate date, LocalTime heure, String description, String statut, Patient patient,
			Medecin medecin) {
		super();
		this.id = id;
		this.date = date;
		this.heure = heure;
		this.description = description;
		this.statut = statut;
		this.patient = patient;
		this.medecin = medecin;
	}

	@ManyToOne
    @JoinColumn(name = "patient_id", nullable = false)
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "medecin_id", nullable = false)
    private Medecin medecin;

    // Getters et setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getHeure() {
        return heure;
    }

    public void setHeure(LocalTime heure) {
        this.heure = heure;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Medecin getMedecin() {
        return medecin;
    }

    public void setMedecin(Medecin medecin) {
        this.medecin = medecin;
    }
}
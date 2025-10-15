package com.politv.politv_api.model;

import jakarta.persistence.*;

import java.sql.Blob;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "suscripcionvip")
public class Suscripcion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "programa_id")
    private int programaId;

    @Column(name = "usuario_id")
    private String autor;

    @Column(name = "fecha_inicio")
    private LocalDate fechaInicio;

    @Column(name = "fecha_fin")
    private LocalDateTime fechaFin;

    @Column (name = "activa")
    private boolean activa;

    public Suscripcion(int id, int programaId, String autor, LocalDate fechaInicio, LocalDateTime fechaFin, boolean activa) {
        this.id = id;
        this.programaId = programaId;
        this.autor = autor;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.activa = activa;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProgramaId() {
        return programaId;
    }

    public void setProgramaId(int programaId) {
        this.programaId = programaId;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public LocalDate getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public LocalDateTime getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(LocalDateTime fechaFin) {
        this.fechaFin = fechaFin;
    }

    public boolean isActiva() {
        return activa;
    }

    public void setActiva(boolean activa) {
        this.activa = activa;
    }
}

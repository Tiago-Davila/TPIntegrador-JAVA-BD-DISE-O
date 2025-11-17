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


    @Column(name = "programa_id", nullable = false)
    private int programaId;


    @Column(name = "usuario_id", nullable = false)
    private int usuarioId;

    @Column(name = "fecha_inicio")
    private LocalDate fechaInicio;

    @Column(name = "fecha_fin")
    private LocalDateTime fechaFin;

    @Column (name = "activa")
    private boolean activa;

    public Suscripcion(Integer usuarioId, Integer programaId) {
        this.usuarioId = usuarioId;
        this.programaId = programaId;
    }
    public Suscripcion(){}

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

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
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

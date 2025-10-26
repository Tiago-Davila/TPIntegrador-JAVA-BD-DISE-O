package com.politv.politv_api.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "encuesta")
public class Encuesta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "programa_id")
    private int programaId;
    @Column(name = "titulo")
    private String titulo;
    @Column(name = "fecha_creacion")
    private LocalDate fechaCreacion;
    @Column(name = "fecha_fin")
    private LocalDate fechaFin;
    @Column(name = "activa")
    private boolean activa;

    @OneToMany(mappedBy = "encuesta", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Opcion> opciones;
    // para obtener las opciones que estan en otra tabla

    public Encuesta(Integer id, int programaId, String titulo, LocalDate fechaCreacion, LocalDate fechaFin, boolean activa) {
        this.id = id;
        this.programaId = programaId;
        this.titulo = titulo;
        this.fechaCreacion = fechaCreacion;
        this.fechaFin = fechaFin;
        this.activa = activa;
    }
    public Encuesta() {}
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getProgramaId() {
        return programaId;
    }

    public void setProgramaId(int programaId) {
        this.programaId = programaId;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public LocalDate getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDate fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public LocalDate getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(LocalDate fechaFin) {
        this.fechaFin = fechaFin;
    }

    public boolean isActiva() {
        return activa;
    }

    public void setActiva(boolean activa) {
        this.activa = activa;
    }
}

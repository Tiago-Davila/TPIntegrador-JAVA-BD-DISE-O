package com.politv.politv_api.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;



@Entity
@Table(name = "encuesta")
public class Encuesta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "programa_id", nullable = false)
    private Integer programaId;

    private String titulo;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion = LocalDateTime.now();

    @Column(name = "fecha_fin")
    private LocalDateTime fechaFin;

    private Boolean activa = true;

    @OneToMany(mappedBy = "encuesta", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Opcion> opciones;

    // Getters y Setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Integer getProgramaId() { return programaId; }
    public void setProgramaId(Integer programaId) { this.programaId = programaId; }

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public LocalDateTime getFechaCreacion() { return fechaCreacion; }
    public void setFechaCreacion(LocalDateTime fechaCreacion) { this.fechaCreacion = fechaCreacion; }

    public LocalDateTime getFechaFin() { return fechaFin; }
    public void setFechaFin(LocalDateTime fechaFin) { this.fechaFin = fechaFin; }

    public Boolean getActiva() { return activa; }
    public void setActiva(Boolean activa) { this.activa = activa; }

    public List<Opcion> getOpciones() { return opciones; }
    public void setOpciones(List<Opcion> opciones) { this.opciones = opciones; }
}

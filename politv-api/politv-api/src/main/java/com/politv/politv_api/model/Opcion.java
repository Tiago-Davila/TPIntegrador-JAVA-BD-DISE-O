package com.politv.politv_api.model;

import com.politv.politv_api.model.Encuesta;
import jakarta.persistence.*;


@Entity
@Table(name = "opciones")
public class Opcion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String opcion;

    @ManyToOne
    @JoinColumn(name = "encuesta_id")
    private Encuesta encuesta;

    // Getters y Setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getOpcion() { return opcion; }
    public void setOpcion(String opcion) { this.opcion = opcion; }

    public Encuesta getEncuesta() { return encuesta; }
    public void setEncuesta(Encuesta encuesta) { this.encuesta = encuesta; }
}



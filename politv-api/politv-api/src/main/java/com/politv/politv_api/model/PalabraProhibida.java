package com.politv.politv_api.model;

import jakarta.persistence.*;

@Entity
@Table(name = "palabraprohibida")
public class PalabraProhibida {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String palabra;

    public PalabraProhibida() {}
    public PalabraProhibida(String palabra) { this.palabra = palabra; }

    // Getters y Setters
    public Integer getId() { return id; }
    public String getPalabra() { return palabra; }

    public void setId(Integer id) { this.id = id; }
    public void setPalabra(String palabra) { this.palabra = palabra; }
}

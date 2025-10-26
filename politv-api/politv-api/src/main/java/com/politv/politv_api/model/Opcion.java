package com.politv.politv_api.model;

import com.politv.politv_api.model.Encuesta;
import jakarta.persistence.*;

@Entity
@Table(name = "opciones")
public class Opcion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "opcion")
    private String texto;

    @ManyToOne
    @JoinColumn(name = "encuesta_id")
    private Encuesta encuesta;

    @ManyToOne
    @JoinColumn(name = "trivia_id")
    private Trivia trivia;

    public Opcion(Integer id, String texto, Encuesta encuesta, Trivia trivia) {
        this.id = id;
        this.texto = texto;
        this.encuesta = encuesta;
        this.trivia = trivia;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Encuesta getEncuesta() {
        return encuesta;
    }

    public void setEncuesta(Encuesta encuesta) {
        this.encuesta = encuesta;
    }

    public Trivia getTrivia() {
        return trivia;
    }

    public void setTrivia(Trivia trivia) {
        this.trivia = trivia;
    }
}


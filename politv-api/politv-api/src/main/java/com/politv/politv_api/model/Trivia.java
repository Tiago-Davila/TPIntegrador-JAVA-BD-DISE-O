package com.politv.politv_api.model;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "trivia")
public class Trivia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer programaId;
    @Column(name = "pregunta")
    private String pregunta;
    @Column(name = "activa")
    private Boolean activa;

    @OneToMany(mappedBy = "trivia", cascade = CascadeType.ALL)
    private List<Opcion> opciones;

    @ManyToOne
    @JoinColumn(name = "respuesta_correcta_id")
    private Opcion respuestaCorrecta;
}


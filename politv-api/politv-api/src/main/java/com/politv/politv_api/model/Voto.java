package com.politv.politv_api.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "voto")
public class Voto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer usuarioId;

    @ManyToOne
    @JoinColumn(name = "encuesta_id")
    private Encuesta encuesta;

    @ManyToOne
    @JoinColumn(name = "opcion_id")
    private Opcion opcion;

    private LocalDateTime fecha = LocalDateTime.now();
}


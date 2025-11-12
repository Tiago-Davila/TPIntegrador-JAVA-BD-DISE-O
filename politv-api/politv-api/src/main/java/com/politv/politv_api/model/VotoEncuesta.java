package com.politv.politv_api.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;



@Entity
@Table(name = "votoencuesta",
        uniqueConstraints = @UniqueConstraint(columnNames = {"usuario_id", "encuesta_id"}))
public class VotoEncuesta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "usuario_id", nullable = false)
    private Integer usuarioId;

    @Column(name = "encuesta_id", nullable = false)
    private Integer encuestaId;

    @Column(name = "opcion_id", nullable = false)
    private Integer opcionId;

    private LocalDateTime fecha = LocalDateTime.now();

    // Constructor vacío
    public VotoEncuesta() {}

    // Constructor con datos
    public VotoEncuesta(Integer usuarioId, Integer encuestaId, Integer opcionId) {
        this.usuarioId = usuarioId;
        this.encuestaId = encuestaId;
        this.opcionId = opcionId;
        this.fecha = LocalDateTime.now();
    }

    // Getters y Setters
    public Integer getId() { return id; }
    public Integer getUsuarioId() { return usuarioId; }
    public Integer getEncuestaId() { return encuestaId; }
    public Integer getOpcionId() { return opcionId; }
    public LocalDateTime getFecha() { return fecha; }
}

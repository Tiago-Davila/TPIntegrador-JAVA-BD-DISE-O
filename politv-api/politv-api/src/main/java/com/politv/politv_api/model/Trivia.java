package com.politv.politv_api.model;

import jakarta.persistence.*;


import java.time.LocalDateTime;

@Entity
@Table(name = "trivia")
public class Trivia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "programa_id", nullable = false)
    private Integer programaId;

    private String pregunta;

    @Column(name = "respuesta_correcta")
    private String respuestaCorrecta;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion = LocalDateTime.now();

    private Boolean activa = true;

    // Getters y Setters
    public Integer getId() { return id; }
    public Integer getProgramaId() { return programaId; }
    public void setProgramaId(Integer programaId) { this.programaId = programaId; }
    public String getPregunta() { return pregunta; }
    public void setPregunta(String pregunta) { this.pregunta = pregunta; }
    public String getRespuestaCorrecta() { return respuestaCorrecta; }
    public void setRespuestaCorrecta(String respuestaCorrecta) { this.respuestaCorrecta = respuestaCorrecta; }
    public LocalDateTime getFechaCreacion() { return fechaCreacion; }
    public void setFechaCreacion(LocalDateTime fechaCreacion) { this.fechaCreacion = fechaCreacion; }
    public Boolean getActiva() { return activa; }
    public void setActiva(Boolean activa) { this.activa = activa; }
}



package com.politv.politv_api.model;



import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "respuestatrivia",
        uniqueConstraints = @UniqueConstraint(columnNames = {"usuario_id", "trivia_id"}))
public class RespuestaTrivia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "usuario_id", nullable = false)
    private Integer usuarioId;

    @Column(name = "trivia_id", nullable = false)
    private Integer triviaId;

    private String respuesta;

    private LocalDateTime fecha = LocalDateTime.now();

    // Getters y Setters
    public Integer getId() { return id; }
    public Integer getUsuarioId() { return usuarioId; }
    public Integer getTriviaId() { return triviaId; }
    public String getRespuesta() { return respuesta; }
    public void setRespuesta(String respuesta) { this.respuesta = respuesta; }
    public LocalDateTime getFecha() { return fecha; }
}


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
    public RespuestaTrivia(Integer triviaId, Integer usuarioId, String respuesta) {
        this.triviaId = triviaId;
        this.usuarioId = usuarioId;
        this.respuesta = respuesta;
    }
    public RespuestaTrivia(Integer id, Integer usuarioId, Integer triviaId, String respuesta, LocalDateTime fecha) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.triviaId = triviaId;
        this.respuesta = respuesta;
        this.fecha = fecha;
    }
    public RespuestaTrivia() {}
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(Integer usuarioId) {
        this.usuarioId = usuarioId;
    }

    public Integer getTriviaId() {
        return triviaId;
    }

    public void setTriviaId(Integer triviaId) {
        this.triviaId = triviaId;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public LocalDateTime getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }
}


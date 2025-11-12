package com.politv.politv_api.model;


import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "favorito")
public class Favorito {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "usuario_id", nullable = false)
    private Integer usuarioId;

    @Column(name = "programa_id", nullable = false)
    private Integer programaId;

    @Column(name = "fecha_agregado", nullable = false)
    private LocalDateTime fechaAgregado = LocalDateTime.now();

    public Favorito() {}

    public Favorito(Integer usuarioId, Integer programaId) {
        this.usuarioId = usuarioId;
        this.programaId = programaId;
        this.fechaAgregado = LocalDateTime.now();
    }

    // Getters y Setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Integer getUsuarioId() { return usuarioId; }
    public void setUsuarioId(Integer usuarioId) { this.usuarioId = usuarioId; }

    public Integer getProgramaId() { return programaId; }
    public void setProgramaId(Integer programaId) { this.programaId = programaId; }

    public LocalDateTime getFechaAgregado() { return fechaAgregado; }
    public void setFechaAgregado(LocalDateTime fechaAgregado) { this.fechaAgregado = fechaAgregado; }
}

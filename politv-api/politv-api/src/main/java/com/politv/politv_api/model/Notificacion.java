package com.politv.politv_api.model;


import jakarta.persistence.*; // Usa jakarta.persistence
import java.time.LocalDateTime;

@Entity
@Table(name = "notificacion")
public class Notificacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "usuario_id")
    private int usuarioId;

    @Column(name = "programa_id")
    private int programaId;

    @Column(name = "mensaje")
    private String mensaje;

    @Column(name = "fecha_envio")
    private LocalDateTime fechaEnvio;

    @Column(name = "enviada", nullable = false)
    private boolean enviada;



    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUsuarioId() { return usuarioId; }
    public void setUsuarioId(int usuarioId) { this.usuarioId = usuarioId; }

    public int getProgramaId() { return programaId; }
    public void setProgramaId(int programaId) { this.programaId = programaId; }

    public String getMensaje() { return mensaje; }
    public void setMensaje(String mensaje) { this.mensaje = mensaje; }

    public LocalDateTime getFechaEnvio() { return fechaEnvio; }
    public void setFechaEnvio(LocalDateTime fechaEnvio) { this.fechaEnvio = fechaEnvio; }

    public boolean isEnviada() { return enviada; }
    public void setEnviada(boolean enviada) { this.enviada = enviada; }
}

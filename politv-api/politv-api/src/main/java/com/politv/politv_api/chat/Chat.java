package com.politv.politv_api.chat;

import com.politv.politv_api.model.Usuario;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "chat")
public class Chat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "usuario_id", referencedColumnName = "id")
    private Usuario usuario;

    @Column(name = "programa_id")
    private Integer programaId;

    @Column(name = "mensaje", columnDefinition = "TEXT")
    private String mensaje;

    @Column(name = "fecha")
    private LocalDateTime fecha = LocalDateTime.now();

    public Chat() {}

    public Chat(Usuario usuario, Integer programaId, String mensaje) {
        this.usuario = usuario;
        this.programaId = programaId;
        this.mensaje = mensaje;
    }

    // Getters y setters
    public Integer getId() { return id; }
    public Usuario getUsuario() { return usuario; }
    public Integer getProgramaId() { return programaId; }
    public String getMensaje() { return mensaje; }
    public LocalDateTime getFecha() { return fecha; }

    public void setId(Integer id) { this.id = id; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }
    public void setProgramaId(Integer programaId) { this.programaId = programaId; }
    public void setMensaje(String mensaje) { this.mensaje = mensaje; }
    public void setFecha(LocalDateTime fecha) { this.fecha = fecha; }

    @Transient
    public String getNombreUsuario() {
        return (usuario != null) ? usuario.getNombreUsuario() : "Anónimo";
    }
}

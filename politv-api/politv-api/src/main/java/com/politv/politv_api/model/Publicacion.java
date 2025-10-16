package com.politv.politv_api.model;
import jakarta.persistence.*;

import java.sql.Blob;
import java.time.LocalDateTime;
@Entity
@Table(name = "publicacion")
public class Publicacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "programa_id")
    private Programa programa;
    @Column(name = "contenido")
    private String texto;
    @Column(name = "usuario_id")
    private int usuarioId;

    @Enumerated
    @Column(name = "estado_publicacion")
    private EstadoPublicacion estadoPublicacion;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion;

    @Column (name = "url_imagen")
    private Blob imagen;

    public Publicacion(int id, Programa programa, String texto, int usuarioId, EstadoPublicacion estadoPublicacion, LocalDateTime fechaCreacion, Blob imagen) {
        this.id = id;
        this.programa = programa;
        this.texto = texto;
        this.usuarioId = usuarioId;
        this.estadoPublicacion = estadoPublicacion;
        this.fechaCreacion = fechaCreacion;
        this.imagen = imagen;
    }
    public Publicacion(){}

    public Programa getPrograma() {
        return programa;
    }

    public void setPrograma(Programa programa) {
        this.programa = programa;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public EstadoPublicacion getEstadoPublicacion() {
        return estadoPublicacion;
    }

    public void setEstadoPublicacion(EstadoPublicacion estadoPublicacion) {
        this.estadoPublicacion = estadoPublicacion;
    }

    public LocalDateTime getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDateTime fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Blob getImagen() {
        return imagen;
    }

    public void setImagen(Blob imagen) {
        this.imagen = imagen;
    }
}

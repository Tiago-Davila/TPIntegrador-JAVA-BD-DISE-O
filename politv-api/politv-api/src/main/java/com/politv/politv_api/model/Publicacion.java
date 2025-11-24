package com.politv.politv_api.model;
import jakarta.persistence.*;
import org.antlr.v4.runtime.misc.IntegerList;

import java.sql.Blob;
import java.time.LocalDateTime;
@Entity
@Table(name = "publicacion")
public class Publicacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "programa_id")
    private Programa programa;
    @Column(name = "contenido")
    private String texto;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    @Enumerated(EnumType.STRING)
    @Column(name = "estado_publicacion")
    private EstadoPublicacion estadoPublicacion;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion;

    @Column (name = "url_imagen")
    private Blob imagen;

    @Column (name = "likes")
    private int likes;

    public Publicacion(Programa programa, String texto, Usuario usuario, EstadoPublicacion estadoPublicacion) {
        this.programa = programa;
        this.texto = texto;
        this.usuario = usuario;
        this.estadoPublicacion = estadoPublicacion;
        this.fechaCreacion = LocalDateTime.now();
        this.likes = 0;
    }// para crear publicaciones mas facil

    public Publicacion(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Programa getPrograma() {
        return programa;
    }

    public void setPrograma(Programa programa) {
        this.programa = programa;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
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

    public int getLikes() {return likes;}
    public void setLikes(int likes) {
        this.likes = likes;
    }
}

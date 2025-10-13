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

    @Column(name = "programa_id")
    private int programaId; // Relacion con la entidad Programa
    @Column(name = "contenido")
    private String texto;
    @Column(name = "usuario_id")
    private String autor;

    @Column(name = "estado_publicacion") // Enum o String para el estado (ej: PUBLICADO)
    private EstadoPublicacion estadoPublicacion;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion;

    @Column (name = "url_imagen")
    private Blob imagen;

    public Publicacion(int id, int programaId, String texto, String autor, EstadoPublicacion estadoPublicacion, LocalDateTime fechaCreacion, Blob imagen) {
        this.id = id;
        this.programaId = programaId;
        this.texto = texto;
        this.autor = autor;
        this.estadoPublicacion = estadoPublicacion;
        this.fechaCreacion = fechaCreacion;
        this.imagen = imagen;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProgramaId() {
        return programaId;
    }

    public void setProgramaId(int programaId) {
        this.programaId = programaId;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
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

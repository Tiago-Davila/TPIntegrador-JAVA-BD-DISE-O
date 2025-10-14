package com.politv.politv_api.dto;

public class PublicacionDTO {
    private String nombrePublicacion;
    private String contenido;

    public PublicacionDTO(String nombrePublicacion, String contenido) {
        this.nombrePublicacion = nombrePublicacion;
        this.contenido = contenido;
    }

    public String getNombrePublicacion() {
        return nombrePublicacion;
    }

    public void setNombrePublicacion(String nombrePublicacion) {
        this.nombrePublicacion = nombrePublicacion;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
}

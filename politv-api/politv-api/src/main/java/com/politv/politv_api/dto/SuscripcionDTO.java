package com.politv.politv_api.dto;

import com.politv.politv_api.model.Suscripcion;

public class SuscripcionDTO {
    private  int id;
    private Suscripcion suscripcion;

    public SuscripcionDTO(int id, Suscripcion suscripcion) {
        this.id = id;
        this.suscripcion = suscripcion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Suscripcion getSuscripcion() {
        return suscripcion;
    }

    public void setSuscripcion(Suscripcion suscripcion) {
        this.suscripcion = suscripcion;
    }
}

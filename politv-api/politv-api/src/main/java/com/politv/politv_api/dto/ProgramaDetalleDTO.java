package com.politv.politv_api.dto;

public class ProgramaDetalleDTO {
    private Integer id;
    private String nombre;
    private String descripcion;
    private String horario; // Ej: "Lunes a Viernes 19:00 hs"
    private boolean enVivo;

    public ProgramaDetalleDTO(Integer id, String nombre, String descripcion, String horario, boolean enVivo) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.horario = horario;
        this.enVivo = enVivo;
    }

    // Getters
    public Integer getId() { return id; }
    public String getNombre() { return nombre; }
    public String getDescripcion() { return descripcion; }
    public String getHorario() { return horario; }
    public boolean isEnVivo() { return enVivo; }
}
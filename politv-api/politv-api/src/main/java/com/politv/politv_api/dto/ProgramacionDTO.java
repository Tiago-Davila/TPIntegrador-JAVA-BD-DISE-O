package com.politv.politv_api.dto;

public class ProgramacionDTO {
    private String nombrePrograma;
    private String descripcion;
    private String franja;
    private String horaInicio;
    private String horaFin;

    public ProgramacionDTO(String nombrePrograma, String descripcion, String franja, String horaInicio, String horaFin) {
        this.nombrePrograma = nombrePrograma;
        this.descripcion = descripcion;
        this.franja = franja;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
    }

    // Getters y setters
    public String getNombrePrograma() { return nombrePrograma; }
    public void setNombrePrograma(String nombrePrograma) { this.nombrePrograma = nombrePrograma; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public String getFranja() { return franja; }
    public void setFranja(String franja) { this.franja = franja; }

    public String getHoraInicio() { return horaInicio; }
    public void setHoraInicio(String horaInicio) { this.horaInicio = horaInicio; }

    public String getHoraFin() { return horaFin; }
    public void setHoraFin(String horaFin) { this.horaFin = horaFin; }
}

package com.politv.politv_api.chat;

public class ChatMessage {
    private Integer usuarioId;
    private Integer programaId;
    private String mensaje;
    private String nombreUsuario;

    public ChatMessage() {}

    public ChatMessage(Integer usuarioId, Integer programaId, String mensaje, String nombreUsuario) {
        this.usuarioId = usuarioId;
        this.programaId = programaId;
        this.mensaje = mensaje;
        this.nombreUsuario = nombreUsuario;
    }

    public Integer getUsuarioId() { return usuarioId; }
    public Integer getProgramaId() { return programaId; }
    public String getMensaje() { return mensaje; }
    public String getNombreUsuario() { return nombreUsuario; }

    public void setUsuarioId(Integer usuarioId) { this.usuarioId = usuarioId; }
    public void setProgramaId(Integer programaId) { this.programaId = programaId; }
    public void setMensaje(String mensaje) { this.mensaje = mensaje; }
    public void setNombreUsuario(String nombreUsuario) { this.nombreUsuario = nombreUsuario; }
}


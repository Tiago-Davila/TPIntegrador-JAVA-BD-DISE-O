package com.politv.politv_api.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "usuario")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "nombre_usuario")
    private String nombreUsuario;

    private String mail;
    private String telefono;
    private String contrasena;

    @Column(name = "fecha_registro")
    private LocalDateTime fechaRegistro;

    // Getters y setters
    public Integer getId() { return id; }
    public String getNombreUsuario() { return nombreUsuario; }
    public String getMail() { return mail; }
    public String getTelefono() { return telefono; }
    public String getContrasena() { return contrasena; }
    public LocalDateTime getFechaRegistro() { return fechaRegistro; }

    public void setId(Integer id) { this.id = id; }
    public void setNombreUsuario(String nombreUsuario) { this.nombreUsuario = nombreUsuario; }
    public void setMail(String mail) { this.mail = mail; }
    public void setTelefono(String telefono) { this.telefono = telefono; }
    public void setContrasena(String contrasena) { this.contrasena = contrasena; }
    public void setFechaRegistro(LocalDateTime fechaRegistro) { this.fechaRegistro = fechaRegistro; }
}


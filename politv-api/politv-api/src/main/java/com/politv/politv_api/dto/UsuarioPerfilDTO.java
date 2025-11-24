package com.politv.politv_api.dto; // Ajusta el paquete si es necesario
import java.util.List;

public class UsuarioPerfilDTO {
    private Integer id;
    private String username;
    private String email;
    private String telefono;
    private String fullName; // Usaremos el nombre de usuario como nombre real por ahora
    private List<SuscripcionDTO> suscripciones;

    // Constructor, Getters y Setters
    public UsuarioPerfilDTO(Integer id, String username, String email, String telefono, List<SuscripcionDTO> suscripciones) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.telefono = telefono;
        this.fullName = username; // En tu DB no hay campo "nombre real", usamos el user
        this.suscripciones = suscripciones;
    }

    // Getters necesarios para que Jackson convierta a JSON
    public Integer getId() { return id; }
    public String getUsername() { return username; }
    public String getEmail() { return email; }
    public String getTelefono() { return telefono; }
    public String getFullName() { return fullName; }
    public List<SuscripcionDTO> getSuscripciones() { return suscripciones; }
}

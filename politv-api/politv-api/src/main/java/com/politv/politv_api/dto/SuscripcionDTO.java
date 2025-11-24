package com.politv.politv_api.dto;

public class SuscripcionDTO {
    private Integer id;
    private String name;
    private String handle;

    public SuscripcionDTO(Integer id, String name) {
        this.id = id;
        this.name = name;
        this.handle = name.replaceAll("\\s+", ""); // genera un handle simple sacando espacios
    }

    public Integer getId() { return id; }
    public String getName() { return name; }
    public String getHandle() { return handle; }
}
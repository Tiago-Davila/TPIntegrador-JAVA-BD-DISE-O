package com.politv.politv_api.model;

import jakarta.persistence.*;

@Entity
@Table(name = "programastaff")
public class ProgramasStaff {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "programa_id")
    private Integer programaId;
    @Column(name = "staff_id")
    private Integer staffId;

    public ProgramasStaff(Integer id, Integer programaId, Integer staffId) {
        this.id = id;
        this.programaId = programaId;
        this.staffId = staffId;
    }
    public ProgramasStaff() {}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProgramaId() {
        return programaId;
    }

    public void setProgramaId(Integer programaId) {
        this.programaId = programaId;
    }

    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
    }
}

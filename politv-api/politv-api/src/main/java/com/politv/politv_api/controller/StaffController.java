package com.politv.politv_api.controller;

import com.politv.politv_api.model.Publicacion;
import com.politv.politv_api.model.Staff;
import com.politv.politv_api.repository.ProgramasStaffRepository;
import com.politv.politv_api.repository.StaffRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class StaffController {
    private final StaffRepository staffRepository;
    private final ProgramasStaffRepository programasStaffRepository;

    public StaffController(StaffRepository staffRepository, ProgramasStaffRepository programasStaffRepository) {
        this.staffRepository = staffRepository;
        this.programasStaffRepository = programasStaffRepository;
    }

    public StaffRepository getStaffRepository() {
        return staffRepository;
    }

    public ProgramasStaffRepository getProgramasStaffRepository() {
        return programasStaffRepository;
    }

    @GetMapping("/staff/{staffId}")
    public Optional<Staff> listarStaff(@PathVariable Integer staffId) {
        return staffRepository.findById(staffId);
    }
    @GetMapping("/programas/{programaId}/staff")
    public Optional<Staff> listarStaffPorPrograma(@PathVariable Integer programaId) {
        return programasStaffRepository.findByProgramaId(programaId);
    }
}

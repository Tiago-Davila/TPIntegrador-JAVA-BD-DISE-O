package com.politv.politv_api.controller;

import com.politv.politv_api.model.Publicacion;
import com.politv.politv_api.model.Staff;
import com.politv.politv_api.repository.ProgramasStaffRepository;
import com.politv.politv_api.repository.StaffRepository;
import com.politv.politv_api.service.StaffProframaService;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class StaffController {
    private final StaffRepository staffRepository;
    private final StaffProframaService  staffProframaService;

    public StaffController(StaffRepository staffRepository, StaffProframaService staffProframaService) {
        this.staffRepository = staffRepository;
        this.staffProframaService = staffProframaService;
    }

    public StaffRepository getStaffRepository() {
        return staffRepository;
    }

    public StaffProframaService getStaffProframaService() {
        return staffProframaService;
    }

    @GetMapping("/staff/{staffId}")
    public Optional<Staff> listarStaff(@PathVariable Integer staffId) {
        return staffRepository.findById(staffId);
    }
    @GetMapping("/programas/{programaId}/staff")
    public List<Staff> listarStaffPorPrograma(@PathVariable Integer programaId) {
        return staffProframaService.listarStaffPorPrograma(programaId);
    }
}

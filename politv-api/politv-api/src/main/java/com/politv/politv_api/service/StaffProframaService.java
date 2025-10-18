package com.politv.politv_api.service;

import com.politv.politv_api.model.Staff;
import com.politv.politv_api.repository.ProgramasStaffRepository;
import com.politv.politv_api.repository.StaffRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class StaffProframaService {
    private final StaffRepository staffRepository;
    private final ProgramasStaffRepository programasStaffRepository;

    public StaffProframaService(StaffRepository staffRepository, ProgramasStaffRepository programasStaffRepository) {
        this.staffRepository = staffRepository;
        this.programasStaffRepository = programasStaffRepository;
    }

    public StaffRepository getStaffRepository() {
        return staffRepository;
    }

    public ProgramasStaffRepository getProgramasStaffRepository() {
        return programasStaffRepository;
    }

    public Staff econtrarPorPrograma(int programaId) {
        return  programasStaffRepository.findByProgramaId(programaId).orElse(null);
    }
}

package com.politv.politv_api.service;

import com.politv.politv_api.model.ProgramasStaff;
import com.politv.politv_api.model.Staff;
import com.politv.politv_api.repository.ProgramasStaffRepository;
import com.politv.politv_api.repository.StaffRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
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

    public List<Staff> listarStaffPorPrograma(Integer programaId) {
        List<ProgramasStaff> relaciones = programasStaffRepository.findByProgramaId(programaId);
        List<Staff> staff = new ArrayList<>();

        for (ProgramasStaff relacion : relaciones) {
            staffRepository.findById(relacion.getStaffId()).ifPresent(staff::add);
        }

        return staff;
    }
}

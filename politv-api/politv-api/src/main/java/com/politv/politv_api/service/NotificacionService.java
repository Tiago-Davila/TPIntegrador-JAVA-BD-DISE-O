package com.politv.politv_api.service;

import java.util.List;
import java.util.stream.Collectors;

import com.politv.politv_api.model.Notificacion;
import com.politv.politv_api.model.Programacion;
import com.politv.politv_api.model.Usuario;
import com.politv.politv_api.repository.NotificacionRepository;
import com.politv.politv_api.repository.ProgramacionRepository;
import com.politv.politv_api.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;

@Service
public class NotificacionService {

    @Autowired//inyecta un repositorio y lo deja en memoria si ya existe, esto para no tener que hacer new Repository
    private NotificacionRepository notificacionRepository;

    public Notificacion crearRecordatorio(Notificacion nueva) {
        nueva.setEnviada(false);
        return notificacionRepository.save(nueva);
    }

    public List<Notificacion> listarProximas(int usuarioId) {
        LocalDateTime ahora = LocalDateTime.now();
        return notificacionRepository.findByUsuarioIdAndFechaEnvioAfterOrderByFechaEnvioAsc(usuarioId, ahora);
    }
}

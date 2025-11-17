package com.politv.politv_api.chat;

import com.politv.politv_api.model.Usuario;
import com.politv.politv_api.repository.UsuarioRepository;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/api/chat")
public class ChatController {

    private final ChatRepository chatRepository;
    private final UsuarioRepository usuarioRepository;

    public ChatController(ChatRepository chatRepository, UsuarioRepository usuarioRepository) {
        this.chatRepository = chatRepository;
        this.usuarioRepository = usuarioRepository;
    }

    @MessageMapping("/chat/{programaId}")
    @SendTo("/topic/chat/{programaId}")
    public ChatMessage enviarMensaje(ChatMessage msg) {
        Usuario usuario = usuarioRepository.findById(msg.getUsuarioId())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        Chat nuevo = new Chat(usuario, msg.getProgramaId(), msg.getMensaje());
        chatRepository.save(nuevo);

        msg.setNombreUsuario(usuario.getNombreUsuario());
        return msg;
    }

    @GetMapping("/historial/{programaId}")
    public List<Chat> historial(@PathVariable Integer programaId) {
        return chatRepository.findByProgramaIdOrderByFechaAsc(programaId);
    }
}

-- b
-- verificar tabla de prohibidoscategoria
DELIMITER //
create trigger verificarPalabrasProhibidas before insert on publicacion for each row
begin
    if new.contenido in (select palabra from palabraprohibida) then
        set new.estado_publicacion = 'PENDIENTE_REVISION';
    end if;
end//
DELIMITER ;
drop trigger verificarPalabrasProhibidas;

-- c 
-- los comentorios y post tienen likes o las publicaciones tienen likes 
delimiter //
create procedure cantidadLikes (in idPrograma int) 
begin 
select sum(likes), count(publicacion.id) from publicacion where idPrograma = publicacion.programa_id;
end // 
delimiter ;
drop procedure cantidadLikes;

-- d
delimiter //
create function cantidadDePublicacionesUsuario (fechaInicio date, fechaFin date, usuarioID int) returns int deterministic
begin 
	declare cantidadPublicaciones int;
	select count(publicacion.id) into cantidadPublicaciones from publicacion 
    where date(publicacion.fecha_creacion) between fechaInicio and fechaFin 
	and publicacion.usuario_id = usuarioID;
	return cantidadPublicaciones;
end // 
delimiter ;
drop function cantidadDePublicacionesUsuario;

delimiter // 
create function cantidadDeFavoritosUsuario(fechaInicio date, fechaFin date, usuarioID int) returns int deterministic
begin 
	declare cantidadFavoritos int;
	select count(favorito.id) into cantidadFavoritos from favorito 
    where date(favorito.fecha) between fechaInicio and fechaFin and usuarioID = favorito.usuarioId;
	return cantidadFavoritos;
end // 
delimiter ;
drop function cantidadDeFavoritosUsuario;

delimiter //
create procedure usuariosInteractuaronTresVeces(in fechaInicio date, in fechaFin date)
begin
	select usuario.id from usuario join publicacion on usuario.id = publicacion.usuario_id
	where cantidadDePublicacionesUsuario(fechaInicio, fechaFin, usuario.id) > 3 
    or cantidadDeFavoritosUsuario(fechaInicio, fechaFin, usuario.id) > 3 group by usuario.id;
end //
delimiter ;
drop procedure usuariosInteractuaronTresVeces;

-- e
delimiter //
create Event borrarPublicacionVieja on schedule EVERY 1 month starts now() DO
begin 
	delete from publicacion where timestampdiff(year, fecha, now()) > 10;
end //
delimiter ;

-- f 
delimiter //
create Event enviarNotificacion on schedule every 1 day DO
begin
	insert into notificacion(usuarioId, mensaje, fechaEnvio)
	select usuarioId, concat("Manana se trasmite", programa.nombre, " a las ", programa.horaInicio), programacion.fecha + interval 1 DAY
	from favorito join programa on programaId = programa.id join programacion on programaId = programa.id where timediff(programacion.fecha, curdate()) = 1;
end //
delimiter ;

-- Inserts para tabla usuario
INSERT INTO usuario (nombreUsuario, mail, telefono, contrasena, fechaRegistro) VALUES
('martin_2024', 'martin.gomez@gmail.com', '1145678901', '$2a$10$hashedpassword1', '2024-01-15 10:30:00'),
('laura_tv', 'laura.fernandez@outlook.com', '1156789012', '$2a$10$hashedpassword2', '2024-02-20 14:20:00'),
('carlos_fan', 'carlos.rodriguez@hotmail.com', '1167890123', '$2a$10$hashedpassword3', '2024-03-10 09:15:00'),
('ana_streaming', 'ana.martinez@yahoo.com', '1178901234', '$2a$10$hashedpassword4', '2024-04-05 16:45:00'),
('jorge_vip', 'jorge.lopez@gmail.com', '1189012345', '$2a$10$hashedpassword5', '2024-05-12 11:00:00');

-- Inserts para tabla programa
INSERT INTO programa (nombre, descripcion, categoria, fecha_inicio, fecha_fin, duracion_minutos, especial) VALUES
('Cortá por Lozano', 'Programa de entretenimiento conducido por Verónica Lozano con invitados, juegos y actualidad', 'Entretenimiento', '2020-03-01', NULL, 120, 0),
('Telefe Noticias', 'Noticiero central de Telefe con Rodolfo Barili', 'Noticias', '2015-01-01', NULL, 60, 0),
('Bendita TV', 'Programa de humor y actualidad conducido por Beto Casella', 'Entretenimiento', '2005-03-14', NULL, 90, 0),
('Nadie Dice Nada', 'Streaming de humor con Nico Occhiato en Luzu TV', 'Entretenimiento', '2022-06-01', NULL, 180, 0),
('Gelatina', 'Programa de streaming conducido por Migue Granados en Olga', 'Cultura', '2021-09-15', NULL, 120, 0);

-- Inserts para tabla staff
INSERT INTO staff (nombre, apellido, rol, redSocial, biografia) VALUES
('Verónica', 'Lozano', 'Conductor', '@verolozanoOK', 'Conductora y actriz argentina'),
('Rodolfo', 'Barili', 'Conductor', '@rbarili', 'Periodista y conductor de noticias'),
('Beto', 'Casella', 'Conductor', '@betocasella', 'Conductor y locutor humorístico'),
('Nico', 'Occhiato', 'Conductor', '@nicoocchiato', 'Conductor y empresario de streaming'),
('Migue', 'Granados', 'Conductor', '@miguegranados', 'Conductor y comediante');

-- Inserts para tabla programastaff
INSERT INTO programastaff (programaId, staffId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserts para tabla programacion
INSERT INTO programacion (programaId, fecha, franja, horaInicio, horaFin, dia) VALUES
(1, '2024-10-09', 'tarde', '13:45:00', '15:45:00', 'MIERCOLES'),
(2, '2024-10-09', 'noche', '20:00:00', '21:00:00', 'MIERCOLES'),
(3, '2024-10-09', 'noche', '21:30:00', '23:00:00', 'MIERCOLES'),
(4, '2024-10-09', 'tarde', '15:00:00', '18:00:00', 'MIERCOLES'),
(5, '2024-10-09', 'tarde', '17:00:00', '19:00:00', 'MIERCOLES');

-- Inserts para tabla categoria
INSERT INTO categoria (categoria, programa_id) VALUES
('talk-show', 1),
('informativo', 2),
('humor-politico', 3),
('comedia-streaming', 4),
('entrevistas', 5);

-- Inserts para tabla favorito
INSERT INTO favorito (usuarioId, programaId, fecha) VALUES
(1, 1, '2024-06-15 10:30:00'),
(2, 2, '2024-07-20 14:20:00'),
(3, 3, '2024-08-10 09:15:00'),
(4, 4, '2024-09-05 16:45:00'),
(5, 5, '2024-10-01 11:00:00');

-- Inserts para tabla suscripcionvip
INSERT INTO suscripcionvip (usuario_id, programa_id, fecha_inicio, fecha_fin, activa) VALUES
(1, 4, '2024-09-01 00:00:00', '2025-09-01 00:00:00', 1),
(2, 5, '2024-08-15 00:00:00', '2025-08-15 00:00:00', 1),
(3, 1, '2024-07-01 00:00:00', '2025-07-01 00:00:00', 1),
(4, 3, '2024-10-01 00:00:00', '2025-10-01 00:00:00', 1),
(5, 2, '2024-06-01 00:00:00', '2024-12-01 00:00:00', 1);

-- Inserts para tabla chat
INSERT INTO chat (usuarioId, programaId, mensaje, fecha) VALUES
(1, 1, '¡Qué buen invitado hoy!', '2024-10-09 14:30:00'),
(2, 2, 'Excelente cobertura de las noticias', '2024-10-09 20:15:00'),
(3, 3, 'Me muero de risa con este programa', '2024-10-09 22:00:00'),
(4, 4, 'Nadie Dice Nada es lo mejor del streaming argentino', '2024-10-09 16:30:00'),
(5, 5, 'Tremenda entrevista en Gelatina', '2024-10-09 18:20:00');

-- Inserts para tabla publicacion
INSERT INTO publicacion (usuario_id, programa_id, contenido, fecha_creacion, estado_publicacion, url_imagen, likes) VALUES
(1, 1, 'Verónica estuvo increíble en el programa de hoy. Me encantó el segmento de cocina.', '2024-10-09 15:50:00', 'PUBLICADO', NULL,2 ),
(2, 2, 'Las noticias de hoy fueron muy importantes. Gracias por mantener informada a la gente.', '2024-10-09 21:05:00', 'PUBLICADO', NULL,0),
(3, 3, 'Beto y el equipo siempre tan afilados con el humor político. Genios!', '2024-10-09 22:45:00', 'PUBLICADO', NULL,0),
(4, 4, 'El streaming argentino llegó para quedarse. Nadie Dice Nada rompe todo.', '2024-10-09 17:15:00', 'PENDIENTE_REVISION', NULL, 0),
(5, 5, 'Migue Granados es un genio entrevistando. Olga es la mejor plataforma.', '2024-10-09 19:00:00', 'PUBLICADO', NULL, 0);
insert into publicacion (usuario_id, programa_id, contenido, fecha_creacion, estado_publicacion, url_imagen, likes) value (1, 1, 'Increíble rendimiento de River Plate!', '2025-10-09 15:50:00', 'PUBLICADO', NULL, 2);
insert into publicacion (usuario_id, programa_id, contenido, fecha_creacion, estado_publicacion, url_imagen, likes) value (1, 1, 'No me lo banco más', '2025-10-11 15:50:00', 'PUBLICADO', NULL, 2);
insert into publicacion (usuario_id, programa_id, contenido, fecha_creacion, estado_publicacion, url_imagen, likes) value (1, 1, 'Siempre lo mismo.....', '2025-10-11 15:50:00', 'PUBLICADO', NULL, 2);

-- Inserts para tabla encuesta
INSERT INTO encuesta (programaId, titulo, fechaCreacion, fechaFin, activa) VALUES
(1, '¿Cuál fue tu segmento favorito de hoy?', '2024-10-09 13:00:00', '2024-10-09 23:59:59', 1),
(2, '¿Qué noticia te pareció más importante?', '2024-10-09 19:30:00', '2024-10-09 23:59:59', 1),
(3, '¿Quién tuvo la mejor frase de la noche?', '2024-10-09 21:00:00', '2024-10-10 02:00:00', 1),
(4, '¿Qué invitado querés ver en el programa?', '2024-10-09 14:00:00', '2024-10-16 23:59:59', 1),
(5, '¿Qué músico te gustaría que vaya a Gelatina?', '2024-10-09 16:00:00', '2024-10-16 23:59:59', 1);

-- Inserts para tabla trivia
INSERT INTO trivia (programaId, pregunta, respuestaCorrecta, fechaCreacion) VALUES
(1, '¿En qué año comenzó Cortá por Lozano?', '2020', '2024-10-09 13:30:00'),
(2, '¿Quién conduce Telefe Noticias?', 'Rodolfo Barili', '2024-10-09 19:45:00'),
(3, '¿En qué año arrancó Bendita TV?', '2005', '2024-10-09 21:15:00'),
(4, '¿En qué plataforma se transmite Nadie Dice Nada?', 'Luzu TV', '2024-10-09 15:00:00'),
(5, '¿Quién conduce Gelatina?', 'Migue Granados', '2024-10-09 17:00:00');

-- Inserts para tabla opciones
INSERT INTO opciones (encuestaId, opcion, trivia_id) VALUES
(1, 'Cocina', 1),
(1, 'Entrevistas', 1),
(2, 'Política', 2),
(2, 'Economía', 2),
(3, 'Beto Casella', 3);

-- Inserts para tabla votoencuesta
INSERT INTO votoencuesta (encuestaId, usuarioId, opcionId, fecha) VALUES
(1, 1, 21, '2024-10-09 14:00:00'),
(2, 2, 23, '2024-10-09 20:30:00'),
(3, 3, 25, '2024-10-09 22:30:00'),
(1, 4, 22, '2024-10-09 14:15:00'),
(2, 5, 24, '2024-10-09 20:45:00');

-- Inserts para tabla respuestatrivia
INSERT INTO respuestatrivia (triviaId, usuarioId, respuesta, fecha, opciones_id, opciones_trivia_id) VALUES
(1, 1, '2020', '2024-10-09 13:45:00', 21, 1),
(2, 2, 'Rodolfo Barili', '2024-10-09 20:00:00', 23, 2),
(3, 3, '2005', '2024-10-09 21:30:00', 25, 3),
(4, 4, 'Luzu TV', '2024-10-09 15:30:00', 21, 1),
(5, 5, 'Migue Granados', '2024-10-09 17:30:00', 22, 1);

-- Inserts para tabla notificacion
INSERT INTO notificacion (usuarioId, mensaje, fechaEnvio) VALUES
(1, 'Tu programa favorito Cortá por Lozano comienza en 15 minutos', '2024-10-09 13:30:00'),
(2, 'Nueva encuesta disponible en Telefe Noticias', '2024-10-09 19:30:00'),
(3, 'Bendita TV está por comenzar. ¡No te lo pierdas!', '2024-10-09 21:15:00'),
(4, 'Nueva trivia disponible en Nadie Dice Nada', '2024-10-09 14:45:00'),
(5, 'Tu suscripción VIP a Gelatina ha sido renovada', '2024-10-09 10:00:00');

-- Inserts para tabla palabraprohibida
INSERT INTO palabraprohibida (palabra) VALUES
('spam'),
('insulto1'),
('insulto2'),
('groseria1'),
('ofensa1');

-- insert para probar el trigger del punto b
insert into publicacion value(77772, 1, 1, "spam", curdate(), "PUBLICADO", NULL, 0);

-- llamado al procedimiento del punto c
call cantidadLikes(1);

-- llamado al procedimiento que tiene 2 funciones adentro (punto d)
call usuariosInteractuaronTresVeces("2024-1-1", current_date());
-- a
-- que seria una condicion especial 
create trigger cumplirCondicionesEspeciales before insert on programa 
for each row begin 
declare error1 text default "Este programa no es especial" ;
if new.especial = 1 then insert into programa values(null, new.nombre, new.descripcion, new.fechaInicio, new.fechaFin,  new.duracionMinutos, true);
else signal sqlstate '45000' set message_text =  error1;
end if;
end //

 



-- b
-- verificar tabla de prohibidoscategoria

-- c 
-- los comentorios y post tienen likes o las publicaciones tienen likes


-- e
create Event borrarComentariosViejos on schedule Every 1 month
DO
delete from comentario where timestampdiff(year, fecha, now()) > 10;

create Event borrarPublicacionVieja on schedule Every 1 month
DO
delete from publicacion where timestampdiff(year, fecha, now()) > 10;


-- f 
create Event enviarNotificacion on schedule every 1 day
DO 
insert into notificacion(usuarioId, mensaje)
select usuarioId, concat("Manana se trasmite", programa.nombre, " a las ", programa.horaInicio)
from favorito join programa on programaId = programa.id join programacion on programaId = programa.id where timediff(Day, programacion.fecha, curdate()) = 1;




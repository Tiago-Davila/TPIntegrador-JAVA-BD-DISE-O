-- ============================================================
-- BASE DE DATOS: PoliMet
-- Versión reconstruida desde cero con las modificaciones:
-- 1. La tabla "reserva" pasa a llamarse "tickets" (ya no existe "reserva").
-- 2. La tabla "usuarios" incluye los campos: pais, telefono, fecha_nacimiento.
-- 3. Se crea una nueva tabla "secciones" relacionada con "pisos".
-- ============================================================
use PoliMet;
-- ============================================================
-- TABLA: artistas
-- ============================================================
CREATE TABLE artistas (
  id_artista INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  pais VARCHAR(100),
  descripcion TEXT
);

-- ============================================================
-- TABLA: eventos
-- ============================================================
CREATE TABLE eventos (
  id_evento INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT,
  fecha_inicio DATETIME,
  fecha_fin DATETIME,
  capacidad INT
);

-- ============================================================
-- TABLA: membresias
-- ============================================================
CREATE TABLE membresias (
  id_membresia INT AUTO_INCREMENT PRIMARY KEY,
  tipo VARCHAR(50),
  descripcion TEXT
);

-- ============================================================
-- TABLA: usuarios
-- ============================================================
CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  pais VARCHAR(100),
  telefono VARCHAR(20),
  fecha_nacimiento DATE,
  id_membresia INT,
  FOREIGN KEY (id_membresia) REFERENCES membresias(id_membresia)
    ON DELETE SET NULL ON UPDATE CASCADE
);

-- ============================================================
-- TABLA: notificaciones
-- ============================================================
CREATE TABLE notificaciones (
  id_notificacion INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  mensaje TEXT,
  fecha_creacion DATETIME,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- TABLA: pisos
-- ============================================================
CREATE TABLE pisos (
  id_piso INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT
);

-- ============================================================
-- TABLA: secciones (nueva)
-- ============================================================
CREATE TABLE secciones (
  id_seccion INT AUTO_INCREMENT PRIMARY KEY,
  ubicacion VARCHAR(100),
  epoca VARCHAR(100),
  nombre VARCHAR(100),
  nivel_popularidad FLOAT,
  id_piso INT,
  FOREIGN KEY (id_piso) REFERENCES pisos(id_piso)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- TABLA: salas
-- ============================================================
CREATE TABLE salas (
  id_sala INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT,
  id_piso INT,
  FOREIGN KEY (id_piso) REFERENCES pisos(id_piso)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- TABLA: tipos_obra
-- ============================================================
CREATE TABLE tipos_obra (
  id_tipo_obra INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT
);

-- ============================================================
-- TABLA: obras
-- ============================================================
CREATE TABLE obras (
  id_obra INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT,
  epoca VARCHAR(100),
  nivel_popularidad FLOAT DEFAULT 0,
  id_artista INT,
  id_sala INT,
  id_tipo_obra INT,
  FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
    ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (id_sala) REFERENCES salas(id_sala)
    ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (id_tipo_obra) REFERENCES tipos_obra(id_tipo_obra)
    ON DELETE SET NULL ON UPDATE CASCADE
);

-- ============================================================
-- TABLA: tickets (antes "reservas")
-- ============================================================
CREATE TABLE tickets (
  id_ticket INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  id_obra INT,
  fecha_reserva DATE,
  hora_reserva TIME,
  cantidad_personas INT,
  estado ENUM('activa','cancelada'),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_obra) REFERENCES obras(id_obra)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- TABLA: usuarios_eventos
-- ============================================================
CREATE TABLE usuarios_eventos (
  id_usuario INT,
  id_evento INT,
  PRIMARY KEY (id_usuario, id_evento),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_evento) REFERENCES eventos(id_evento)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- TABLA: valoraciones
-- ============================================================
CREATE TABLE valoraciones (
  id_valoracion INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  id_obra INT,
  puntaje INT CHECK (puntaje BETWEEN 1 AND 5),
  comentario TEXT,
  fecha DATE,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_obra) REFERENCES obras(id_obra)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- TABLA: visitas
-- ============================================================
CREATE TABLE visitas (
  id_visita INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  id_obra INT,
  fecha_visita DATETIME,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_obra) REFERENCES obras(id_obra)
    ON DELETE CASCADE ON UPDATE CASCADE
);

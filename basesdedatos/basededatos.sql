CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombreUsuario VARCHAR(50) NOT NULL,
    mail VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    contrasena VARCHAR(255) NOT NULL,
    fechaRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Programa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    categoria ENUM('Noticias','Entretenimiento','Deportes','Tecnologia','Cultura','Lifestyle') NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE,
    duracionMinutos INT NOT NULL,
    especial BOOLEAN DEFAULT FALSE
);
CREATE TABLE Staff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rol ENUM('Conductor','Productor','Columnista','Operador','CommunityManager') NOT NULL
);
CREATE TABLE ProgramaStaff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    programaId INT NOT NULL,
    staffId INT NOT NULL,
    FOREIGN KEY (programaId) REFERENCES Programa(id) ON DELETE CASCADE,
    FOREIGN KEY (staffId) REFERENCES Staff(id) ON DELETE CASCADE
);
CREATE TABLE Comentario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuarioId INT NOT NULL,
    programaId INT NOT NULL,
    contenido TEXT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('PUBLICADO','PENDIENTE_REVISION') DEFAULT 'PUBLICADO',
    FOREIGN KEY (usuarioId) REFERENCES Usuario(id),
    FOREIGN KEY (programaId) REFERENCES Programa(id)
);
CREATE TABLE PalabraProhibida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    palabra VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE Chat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuarioId INT NOT NULL,
    programaId INT NOT NULL,
    mensaje TEXT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuarioId) REFERENCES Usuario(id),
    FOREIGN KEY (programaId) REFERENCES Programa(id)
);
CREATE TABLE SuscripcionVIP (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuarioId INT NOT NULL,
    programaId INT NOT NULL,
    fechaInicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaFin DATETIME,
    UNIQUE(usuarioId, programaId),
    FOREIGN KEY (usuarioId) REFERENCES Usuario(id),
    FOREIGN KEY (programaId) REFERENCES Programa(id)
);
CREATE TABLE Encuesta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    programaId INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fechaFin DATETIME,
    activa BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (programaId) REFERENCES Programa(id)
);
CREATE TABLE OpcionEncuesta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    encuestaId INT NOT NULL,
    opcion VARCHAR(255) NOT NULL,
    FOREIGN KEY (encuestaId) REFERENCES Encuesta(id)
);
CREATE TABLE VotoEncuesta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    encuestaId INT NOT NULL,
    usuarioId INT NOT NULL,
    opcionId INT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(usuarioId, encuestaId),
    FOREIGN KEY (encuestaId) REFERENCES Encuesta(id),
    FOREIGN KEY (usuarioId) REFERENCES Usuario(id),
    FOREIGN KEY (opcionId) REFERENCES OpcionEncuesta(id)
);
CREATE TABLE Trivia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    programaId INT NOT NULL,
    pregunta TEXT NOT NULL,
    respuestaCorrecta VARCHAR(255) NOT NULL,
    fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (programaId) REFERENCES Programa(id)
);

CREATE TABLE RespuestaTrivia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    triviaId INT NOT NULL,
    usuarioId INT NOT NULL,
    respuesta VARCHAR(255) NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(triviaId, usuarioId),
    FOREIGN KEY (triviaId) REFERENCES Trivia(id),
    FOREIGN KEY (usuarioId) REFERENCES Usuario(id)
);
CREATE TABLE Favorito (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuarioId INT NOT NULL,
    programaId INT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(usuarioId, programaId),
    FOREIGN KEY (usuarioId) REFERENCES Usuario(id),
    FOREIGN KEY (programaId) REFERENCES Programa(id)
);
CREATE TABLE Programacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    programaId INT NOT NULL,
    fecha DATE NOT NULL,
    franja ENUM('mañana','tarde','noche','transnoche') NOT NULL,
    horaInicio TIME NOT NULL,
    horaFin TIME NOT NULL,
    FOREIGN KEY (programaId) REFERENCES Programa(id)
);
CREATE TABLE Notificacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuarioId INT NOT NULL,
    mensaje TEXT NOT NULL,
    fechaEnvio DATETIME DEFAULT CURRENT_TIMESTAMP,
    leida BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (usuarioId) REFERENCES Usuario(id)
);









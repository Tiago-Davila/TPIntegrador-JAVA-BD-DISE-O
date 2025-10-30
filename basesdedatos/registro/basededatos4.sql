-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema basededatostv4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema basededatostv4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `basededatostv4` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `basededatostv4` ;

-- -----------------------------------------------------
-- Table `basededatostv4`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `palabra` (`categoria` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombreUsuario` VARCHAR(50) NOT NULL,
  `mail` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(20) NULL DEFAULT NULL,
  `contrasena` VARCHAR(255) NOT NULL,
  `fechaRegistro` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `mail` (`mail` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`programa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NULL DEFAULT NULL,
  `duracion_minutos` INT NOT NULL,
  `especial` TINYINT(1) NULL DEFAULT '0',
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`, `categoria_id`),
  INDEX `fk_programa_categoria1_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_programa_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `basededatostv4`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`chat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarioId` INT NOT NULL,
  `programaId` INT NOT NULL,
  `mensaje` TEXT NOT NULL,
  `fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `usuarioId` (`usuarioId` ASC) VISIBLE,
  INDEX `programaId` (`programaId` ASC) VISIBLE,
  CONSTRAINT `chat_ibfk_1`
    FOREIGN KEY (`usuarioId`)
    REFERENCES `basededatostv4`.`usuario` (`id`),
  CONSTRAINT `chat_ibfk_2`
    FOREIGN KEY (`programaId`)
    REFERENCES `basededatostv4`.`programa` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`encuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`encuesta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `programaId` INT NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `fechaCreacion` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaFin` DATETIME NULL DEFAULT NULL,
  `activa` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  INDEX `programaId` (`programaId` ASC) VISIBLE,
  CONSTRAINT `encuesta_ibfk_1`
    FOREIGN KEY (`programaId`)
    REFERENCES `basededatostv4`.`programa` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`favorito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`favorito` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarioId` INT NOT NULL,
  `programaId` INT NOT NULL,
  `fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `usuarioId` (`usuarioId` ASC, `programaId` ASC) VISIBLE,
  INDEX `programaId` (`programaId` ASC) VISIBLE,
  CONSTRAINT `favorito_ibfk_1`
    FOREIGN KEY (`usuarioId`)
    REFERENCES `basededatostv4`.`usuario` (`id`),
  CONSTRAINT `favorito_ibfk_2`
    FOREIGN KEY (`programaId`)
    REFERENCES `basededatostv4`.`programa` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`notificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`notificacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarioId` INT NOT NULL,
  `mensaje` TEXT NOT NULL,
  `fechaEnvio` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `usuarioId` (`usuarioId` ASC) VISIBLE,
  CONSTRAINT `notificacion_ibfk_1`
    FOREIGN KEY (`usuarioId`)
    REFERENCES `basededatostv4`.`usuario` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`trivia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`trivia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `programaId` INT NOT NULL,
  `pregunta` TEXT NOT NULL,
  `respuestaCorrecta` VARCHAR(255) NOT NULL,
  `fechaCreacion` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `programaId` (`programaId` ASC) VISIBLE,
  CONSTRAINT `trivia_ibfk_1`
    FOREIGN KEY (`programaId`)
    REFERENCES `basededatostv4`.`programa` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`opciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`opciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `encuestaId` INT NOT NULL,
  `opcion` VARCHAR(255) NOT NULL,
  `trivia_id` INT NOT NULL,
  PRIMARY KEY (`id`, `trivia_id`),
  INDEX `encuestaId` (`encuestaId` ASC) VISIBLE,
  INDEX `fk_opciones_trivia1_idx` (`trivia_id` ASC) VISIBLE,
  CONSTRAINT `fk_opciones_trivia1`
    FOREIGN KEY (`trivia_id`)
    REFERENCES `basededatostv4`.`trivia` (`id`),
  CONSTRAINT `opcionencuesta_ibfk_1`
    FOREIGN KEY (`encuestaId`)
    REFERENCES `basededatostv4`.`encuesta` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`palabraprohibida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`palabraprohibida` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `palabra` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `palabra` (`palabra` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`programacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`programacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `programa_id` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `franja` ENUM('MANANIA', 'TARDE', 'NOCHE', 'TRASNOCHE') NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_fin` TIME NOT NULL,
  `dia` ENUM('LUNES', 'MARTES', 'MIERCOLES', 'JUEVES', 'VIERNES', 'SABADO', 'DOMINGO') NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `programaId` (`programa_id` ASC) VISIBLE,
  CONSTRAINT `programacion_ibfk_1`
    FOREIGN KEY (`programa_id`)
    REFERENCES `basededatostv4`.`programa` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`staff` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `rol` ENUM('Conductor', 'Productor', 'Columnista', 'Operador', 'CommunityManager') NOT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `redSocial` VARCHAR(45) NULL DEFAULT NULL,
  `biografia` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`programastaff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`programastaff` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `programaId` INT NOT NULL,
  `staffId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `programaId` (`programaId` ASC) VISIBLE,
  INDEX `staffId` (`staffId` ASC) VISIBLE,
  CONSTRAINT `programastaff_ibfk_1`
    FOREIGN KEY (`programaId`)
    REFERENCES `basededatostv4`.`programa` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `programastaff_ibfk_2`
    FOREIGN KEY (`staffId`)
    REFERENCES `basededatostv4`.`staff` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`publicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`publicacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `programa_id` INT NOT NULL,
  `contenido` TEXT NOT NULL,
  `fecha_creacion` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_publicacion` ENUM('PUBLICADO', 'PENDIENTE_REVISION') NULL DEFAULT 'PUBLICADO',
  `url_imagen` BLOB NULL DEFAULT NULL,
  `likes` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `usuarioId` (`usuario_id` ASC) VISIBLE,
  INDEX `programaId` (`programa_id` ASC) VISIBLE,
  CONSTRAINT `comentario_ibfk_10`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `basededatostv4`.`usuario` (`id`),
  CONSTRAINT `comentario_ibfk_20`
    FOREIGN KEY (`programa_id`)
    REFERENCES `basededatostv4`.`programa` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 77778
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`respuestatrivia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`respuestatrivia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `triviaId` INT NOT NULL,
  `usuarioId` INT NOT NULL,
  `respuesta` VARCHAR(255) NOT NULL,
  `fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `opciones_id` INT NOT NULL,
  `opciones_trivia_id` INT NOT NULL,
  PRIMARY KEY (`id`, `opciones_id`, `opciones_trivia_id`),
  UNIQUE INDEX `triviaId` (`triviaId` ASC, `usuarioId` ASC) VISIBLE,
  INDEX `usuarioId` (`usuarioId` ASC) VISIBLE,
  INDEX `fk_respuestatrivia_opciones1_idx` (`opciones_id` ASC, `opciones_trivia_id` ASC) VISIBLE,
  CONSTRAINT `fk_respuestatrivia_opciones1`
    FOREIGN KEY (`opciones_id` , `opciones_trivia_id`)
    REFERENCES `basededatostv4`.`opciones` (`id` , `trivia_id`),
  CONSTRAINT `respuestatrivia_ibfk_1`
    FOREIGN KEY (`triviaId`)
    REFERENCES `basededatostv4`.`trivia` (`id`),
  CONSTRAINT `respuestatrivia_ibfk_2`
    FOREIGN KEY (`usuarioId`)
    REFERENCES `basededatostv4`.`usuario` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`suscripcionvip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`suscripcionvip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `programa_id` INT NOT NULL,
  `fecha_inicio` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_fin` DATETIME NULL DEFAULT NULL,
  `activa` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `usuarioId` (`usuario_id` ASC, `programa_id` ASC) VISIBLE,
  INDEX `programaId` (`programa_id` ASC) VISIBLE,
  CONSTRAINT `suscripcionvip_ibfk_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `basededatostv4`.`usuario` (`id`),
  CONSTRAINT `suscripcionvip_ibfk_2`
    FOREIGN KEY (`programa_id`)
    REFERENCES `basededatostv4`.`programa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `basededatostv4`.`votoencuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostv4`.`votoencuesta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `encuestaId` INT NOT NULL,
  `usuarioId` INT NOT NULL,
  `opcionId` INT NOT NULL,
  `fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `usuarioId` (`usuarioId` ASC, `encuestaId` ASC) VISIBLE,
  INDEX `encuestaId` (`encuestaId` ASC) VISIBLE,
  INDEX `opcionId` (`opcionId` ASC) VISIBLE,
  CONSTRAINT `votoencuesta_ibfk_1`
    FOREIGN KEY (`encuestaId`)
    REFERENCES `basededatostv4`.`encuesta` (`id`),
  CONSTRAINT `votoencuesta_ibfk_2`
    FOREIGN KEY (`usuarioId`)
    REFERENCES `basededatostv4`.`usuario` (`id`),
  CONSTRAINT `votoencuesta_ibfk_3`
    FOREIGN KEY (`opcionId`)
    REFERENCES `basededatostv4`.`opciones` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

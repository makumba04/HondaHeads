-- Crea la base de datos para guardar la información de todos los usuarios, hilos y comentarios del foro
CREATE DATABASE IF NOT EXISTS hondaheadsForo DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

-- Crea las tablas que conforman la base de datos

CREATE TABLE IF NOT EXISTS users ( -- Tabla de usuarios: Contiene toda la información de los usuarios
    ID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    passwd VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS hilos ( -- Tabla de hilos: Contiene la información de los hilos creados
    ID INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    tema VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS comentarios ( -- Tabla de comentarios: Contiene toda la información de los comentarios dentro de los hilos, creados por los usuarios
    ID INT PRIMARY KEY AUTO_INCREMENT,
    contenido TEXT,
    fecha DATETIME
    userID INT,
    hiloID INT
);

-- IMPORTANTE!! Añadir los FK a la tabla de comentarios para que funcione la estructura

ALTER TABLE comentarios ADD FOREIGN KEY (userID) REFERENCES users(ID);
ALTER TABLE comentarios ADD FOREIGN KEY (hiloID) REFERENCES hilo(ID);
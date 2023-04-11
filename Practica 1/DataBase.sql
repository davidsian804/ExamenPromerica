CREATE DATABASE UserDataBase
USE UserDataBase

CREATE TABLE usuarios (
  id INTEGER PRIMARY KEY IDENTITY(1,1),
  nombre VARCHAR(50) NOT NULL,
  contrasena VARCHAR(50) NOT NULL
);



CREATE PROCEDURE sp_insertar_usuario (
  @nombre VARCHAR(50),
  @contrasena VARCHAR(50)
)
AS
BEGIN
  INSERT INTO usuarios (nombre, contrasena)
  VALUES (@nombre, @contrasena);
END;

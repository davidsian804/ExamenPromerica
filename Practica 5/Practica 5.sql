-- CREACION DE LA BASE DE DATOS
CREATE DATABASE PRACTICA5
USE PRACTICA5


-- TABLA ARTICULO (Articulos para promociones)
CREATE TABLE Articulo (
    COD INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Tipo VARCHAR(50),
    Subtipo VARCHAR(50)
);

-- TABLA SUCURSALES (Sucursales las cuales desean mapear sus inventarios y existencias)
CREATE TABLE Sucursal (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Ubicación VARCHAR(50)
);

--  TABLA ARTICULO_SUCURSAL (esta tabla tiene relación muchos a muchos entre Artículo y Sucursal)
CREATE TABLE Articulo_Sucursal (
    Codigo INT,
    Sucursal_ID INT,
    Cantidad INT,
    PRIMARY KEY (Codigo, Sucursal_ID),
    FOREIGN KEY (Codigo) REFERENCES Articulo(COD),
    FOREIGN KEY (Sucursal_ID) REFERENCES Sucursal(ID)
);

-- tabla Promoción
CREATE TABLE Promoción (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Fecha_Inicio DATE,
    Fecha_Final DATE,
    Costo_Puntos INT,
    Precio_Venta DECIMAL(10,2)
);

-- tabla Artículo_Promoción (esta tabla tambien tiene relación muchos a muchos entre Artículo y Promoción)
CREATE TABLE Articulo_Promocion (
    COD INT,
    Promoción_ID INT,
    PRIMARY KEY (COD, Promoción_ID),
    FOREIGN KEY (COD) REFERENCES Articulo(COD),
    FOREIGN KEY (Promoción_ID) REFERENCES Promoción(ID)
);

-- tabla Canje
CREATE TABLE Canje (
    ID INT PRIMARY KEY,
    Artículo_Canjeadp INT,
    Cantidad_Canjeadp INT,
    Precio_Canjeadp DECIMAL(10,2),
    Promoción_ID INT,
    Observaciones VARCHAR(200),
    FOREIGN KEY (Artículo_Canjeadp) REFERENCES Articulo(COD),
    FOREIGN KEY (Promoción_ID) REFERENCES Promoción(ID)
);




-- LLENADO LAS TABLAS CON ALGUNOS DATOS PARA REPRESENTAR MEJOR LA ESTRUCTURA
-- Agregar datos a la tabla Artículo
INSERT INTO Articulo (COD, Nombre, Tipo, Subtipo) VALUES
(1, 'DVD de Disney', 'Entretenimiento', 'Películas'),
(2, 'Lapicero', 'Oficina', 'Escritura'),
(3, 'Mouse', 'Informática', 'Periféricos');

-- Agregar datos a la tabla Sucursal
INSERT INTO Sucursal (ID, Nombre, Ubicación) VALUES
(1, 'Sucursal A', 'Ciudad 1'),
(2, 'Sucursal B', 'Ciudad 2');

-- Agregar datos a la tabla Artículo_Sucursal
INSERT INTO Articulo_Sucursal (Codigo, Sucursal_ID, Cantidad) VALUES
(1, 1, 20),
(1, 2, 15),
(2, 1, 50),
(2, 2, 75),
(3, 1, 30),
(3, 2, 40);

-- Agregar datos a la tabla Promoción
INSERT INTO Promoción (ID, Nombre, Fecha_Inicio, Fecha_Final, Costo_Puntos, Precio_Venta) VALUES
(1, 'Promoción 1', '2023-01-01', '2023-01-31', 100, 20.50),
(2, 'Promoción 2', '2023-02-01', '2023-02-28', 200, 40.60),
(3, 'Promoción 3', '2023-03-01', '2023-03-31', 300, 80.70);

-- Agregar datos a la tabla Artículo_Promoción
INSERT INTO Articulo_Promocion (COD, Promoción_ID) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2),
(1, 3),
(3, 3);

-- Agregar datos a la tabla Canje
INSERT INTO Canje (ID, Artículo_Canjeadp, Cantidad_Canjeadp, Precio_Canjeadp, Promoción_ID, Observaciones) VALUES
(1, 1, 1, 20.50, 1, 'Canje por DVD de Disney en Promoción 1'),
(2, 2, 2, 40.60, 2, 'Canje por 2 Lapiceros en Promoción 2'),
(3, 3, 1, 60.80, 3, 'Canje por Mouse en Promoción 3');

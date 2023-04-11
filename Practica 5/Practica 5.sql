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
    Ubicaci�n VARCHAR(50)
);

--  TABLA ARTICULO_SUCURSAL (esta tabla tiene relaci�n muchos a muchos entre Art�culo y Sucursal)
CREATE TABLE Articulo_Sucursal (
    Codigo INT,
    Sucursal_ID INT,
    Cantidad INT,
    PRIMARY KEY (Codigo, Sucursal_ID),
    FOREIGN KEY (Codigo) REFERENCES Articulo(COD),
    FOREIGN KEY (Sucursal_ID) REFERENCES Sucursal(ID)
);

-- tabla Promoci�n
CREATE TABLE Promoci�n (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Fecha_Inicio DATE,
    Fecha_Final DATE,
    Costo_Puntos INT,
    Precio_Venta DECIMAL(10,2)
);

-- tabla Art�culo_Promoci�n (esta tabla tambien tiene relaci�n muchos a muchos entre Art�culo y Promoci�n)
CREATE TABLE Articulo_Promocion (
    COD INT,
    Promoci�n_ID INT,
    PRIMARY KEY (COD, Promoci�n_ID),
    FOREIGN KEY (COD) REFERENCES Articulo(COD),
    FOREIGN KEY (Promoci�n_ID) REFERENCES Promoci�n(ID)
);

-- tabla Canje
CREATE TABLE Canje (
    ID INT PRIMARY KEY,
    Art�culo_Canjeadp INT,
    Cantidad_Canjeadp INT,
    Precio_Canjeadp DECIMAL(10,2),
    Promoci�n_ID INT,
    Observaciones VARCHAR(200),
    FOREIGN KEY (Art�culo_Canjeadp) REFERENCES Articulo(COD),
    FOREIGN KEY (Promoci�n_ID) REFERENCES Promoci�n(ID)
);




-- LLENADO LAS TABLAS CON ALGUNOS DATOS PARA REPRESENTAR MEJOR LA ESTRUCTURA
-- Agregar datos a la tabla Art�culo
INSERT INTO Articulo (COD, Nombre, Tipo, Subtipo) VALUES
(1, 'DVD de Disney', 'Entretenimiento', 'Pel�culas'),
(2, 'Lapicero', 'Oficina', 'Escritura'),
(3, 'Mouse', 'Inform�tica', 'Perif�ricos');

-- Agregar datos a la tabla Sucursal
INSERT INTO Sucursal (ID, Nombre, Ubicaci�n) VALUES
(1, 'Sucursal A', 'Ciudad 1'),
(2, 'Sucursal B', 'Ciudad 2');

-- Agregar datos a la tabla Art�culo_Sucursal
INSERT INTO Articulo_Sucursal (Codigo, Sucursal_ID, Cantidad) VALUES
(1, 1, 20),
(1, 2, 15),
(2, 1, 50),
(2, 2, 75),
(3, 1, 30),
(3, 2, 40);

-- Agregar datos a la tabla Promoci�n
INSERT INTO Promoci�n (ID, Nombre, Fecha_Inicio, Fecha_Final, Costo_Puntos, Precio_Venta) VALUES
(1, 'Promoci�n 1', '2023-01-01', '2023-01-31', 100, 20.50),
(2, 'Promoci�n 2', '2023-02-01', '2023-02-28', 200, 40.60),
(3, 'Promoci�n 3', '2023-03-01', '2023-03-31', 300, 80.70);

-- Agregar datos a la tabla Art�culo_Promoci�n
INSERT INTO Articulo_Promocion (COD, Promoci�n_ID) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2),
(1, 3),
(3, 3);

-- Agregar datos a la tabla Canje
INSERT INTO Canje (ID, Art�culo_Canjeadp, Cantidad_Canjeadp, Precio_Canjeadp, Promoci�n_ID, Observaciones) VALUES
(1, 1, 1, 20.50, 1, 'Canje por DVD de Disney en Promoci�n 1'),
(2, 2, 2, 40.60, 2, 'Canje por 2 Lapiceros en Promoci�n 2'),
(3, 3, 1, 60.80, 3, 'Canje por Mouse en Promoci�n 3');

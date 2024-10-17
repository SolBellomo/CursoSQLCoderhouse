
CREATE DATABASE tienda_ropa;

USE tienda_ropa;

CREATE TABLE Usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  direccion VARCHAR(255),
  telefono VARCHAR(20),
  fecha_registro DATE
);

CREATE TABLE Categorias (
  id_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nombre_categoria VARCHAR(100)
);

CREATE TABLE Productos (
  id_UPC INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  descripcion TEXT,
  precio DECIMAL(10, 2),
  stock INT,
  id_categoria INT,
  FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE MetodosPago (
  id_metodo_pago INT PRIMARY KEY AUTO_INCREMENT,
  nombre_metodo VARCHAR(100)
);

CREATE TABLE EstadosPedido (
  id_estado INT PRIMARY KEY AUTO_INCREMENT,
  estado VARCHAR(50)
);

CREATE TABLE Pedidos (
  id_pedido INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT,
  fecha_pedido DATE,
  total DECIMAL(10, 2),
  id_metodo_pago INT,
  estado_actual INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
  FOREIGN KEY (id_metodo_pago) REFERENCES MetodosPago(id_metodo_pago),
  FOREIGN KEY (estado_actual) REFERENCES EstadosPedido(id_estado)
);

CREATE TABLE DetallesPedido (
  id_detalle INT PRIMARY KEY AUTO_INCREMENT,
  id_pedido INT,
  id_UPC INT,
  cantidad INT,
  precio_unitario DECIMAL(10, 2),
  FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
  FOREIGN KEY (id_UPC) REFERENCES Productos(id_UPC)
);
--Parte 2
CREATE DATABASE prueba;
\c prueba

CREATE TABLE categorias(
id_categoria VARCHAR (4),
nombre_categoria VARCHAR(12) NOT NULL,
descripcion_categoria VARCHAR(100) NOT NULL,
PRIMARY KEY (id_categoria) 
);

INSERT INTO categorias (id_categoria, nombre_categoria, descripcion_categoria)
VALUES ('A001','abarrotes','alimentos no perecibles como cereales y granos, condimentos, entre otros');
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion_categoria)
VALUES ('F002','frescos','frutas y verduras de la mejor calidad');
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion_categoria)
VALUES ('P003','preparados','platos cocinados diariamente por nuestro chef');

CREATE TABLE productos(
id_producto VARCHAR(8),
nombre_producto VARCHAR(20) NOT NULL,
descripcion_producto VARCHAR(100) NOT NULL,
precio_producto INT NOT NULL,
id_categoria VARCHAR(12) NOT NULL,
PRIMARY KEY (id_producto),
FOREIGN KEY (id_categoria)
REFERENCES categorias (id_categoria)
);

INSERT INTO productos (id_producto, nombre_producto, descripcion_producto, precio_producto, id_categoria)
VALUES ('A001P001','Azúcar Iansa','1 kilo de azúcar blanca granulada', 2,'A001');
INSERT INTO productos (id_producto, nombre_producto, descripcion_producto, precio_producto, id_categoria)
VALUES ('A001P002','Sal Lobos', '1 kilo de sal extrafina',1,'A001');
INSERT INTO productos (id_producto, nombre_producto, descripcion_producto, precio_producto, id_categoria)
VALUES ('A001P003','Arroz Miraflores', '1 kilo de arroz pregraneado grado 1', 2, 'A001');
INSERT INTO productos (id_producto, nombre_producto, descripcion_producto, precio_producto, id_categoria)
VALUES ('F002P001','Manzana Fuji','malla de 1 kilo de manzanas rojas', 1, 'F002');
INSERT INTO productos (id_producto, nombre_producto, descripcion_producto, precio_producto, id_categoria)
VALUES ('F002P002','Palta Hass', 'malla de 1 kilo de palta hass', 3, 'F002');
INSERT INTO productos (id_producto, nombre_producto, descripcion_producto, precio_producto, id_categoria)
VALUES ('F002P003','Lechuga Costina', 'pack de tres lechugas costinas', 2, 'F002');
INSERT INTO productos (id_producto, nombre_producto, descripcion_producto, precio_producto, id_categoria)
VALUES ('P003P001','Lasagna Bolognesa', 'rellena con salsa de tomate, crema, carne y queso, 2 porciones',4, 'P003');
INSERT INTO productos (id_producto, nombre_producto, descripcion_producto, precio_producto, id_categoria)
VALUES ('P003P002','Torta Tres Leches', 'torta de bizcochuelo, con leche condensada, ideal y crema', 6, 'P003');


CREATE TABLE clientes(
id_cliente SERIAL,
nombre_cliente VARCHAR(30) NOT NULL,
rut_cliente VARCHAR(12) NOT NULL,
direccion_cliente VARCHAR(50) NOT NULL,
PRIMARY KEY (id_cliente)
);
INSERT INTO clientes (nombre_cliente, rut_cliente, direccion_cliente)
VALUES ('Francisco','06.000.000-0','Las Lavándulas 1173, Las Condes');
INSERT INTO clientes (nombre_cliente, rut_cliente, direccion_cliente)
VALUES ('Elena','05.555.555-5','Santa Rita 251, Pirque');
INSERT INTO clientes (nombre_cliente, rut_cliente, direccion_cliente)
VALUES ('Anita','20.888.888-8','Los Acantos 1580, Vitacura');
INSERT INTO clientes (nombre_cliente, rut_cliente, direccion_cliente)
VALUES ('Pedro','18.777.000-0','San Francisco de Asis 1282, Las Condes');
INSERT INTO clientes (nombre_cliente, rut_cliente, direccion_cliente)
VALUES ('Carolina','09.900.460-6','Hernando de Aguirre 801, Providencia');


CREATE TABLE facturas(
id_factura SERIAL,
id_cliente INT NOT NULL,
fecha_factura DATE NOT NULL,
subtotal INT NOT NULL,
iva FLOAT,
precio_total FLOAT,
PRIMARY KEY (id_factura),
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

INSERT INTO facturas (id_cliente, fecha_factura, subtotal,iva, precio_total)
VALUES (1,'2020-05-10',3,0.57,3.57);
INSERT INTO facturas (id_cliente, fecha_factura, subtotal,iva, precio_total)
VALUES (1,'2020-05-12',13,2.47,15.47);
INSERT INTO facturas (id_cliente, fecha_factura, subtotal,iva, precio_total)
VALUES (2,'2020-05-10',6,1.14,7.14);
INSERT INTO facturas (id_cliente, fecha_factura, subtotal,iva, precio_total)
VALUES (2,'2020-05-11',6,1.14,7.14);
INSERT INTO facturas (id_cliente, fecha_factura, subtotal,iva, precio_total)
VALUES (2,'2020-05-13',11,2.09,13.09);
INSERT INTO facturas (id_cliente, fecha_factura, subtotal,iva, precio_total)
VALUES (3,'2020-05-13',6,1.14,7.14);
INSERT INTO facturas (id_cliente, fecha_factura, subtotal,iva, precio_total)
VALUES (4,'2020-05-10',6,1.14,7.14);
INSERT INTO facturas (id_cliente, fecha_factura, subtotal,iva, precio_total)
VALUES (4,'2020-05-11',8,1.52,9.52);
INSERT INTO facturas (id_cliente, fecha_factura, subtotal,iva, precio_total)
VALUES (4,'2020-05-12',8,1.52,9.52);
INSERT INTO facturas (id_cliente, fecha_factura, subtotal,iva, precio_total)
VALUES (4,'2020-05-13',4,0.76,4.76);


CREATE TABLE detalle_facturas(
id_factura INT NOT NULL,
id_producto VARCHAR(8) NOT NULL,
cantidad_producto INT NOT NULL,
PRIMARY KEY (id_factura,id_producto),
FOREIGN KEY (id_factura) REFERENCES facturas (id_factura),
FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);

INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (1,'A001P001',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (1,'A001P002',1);

INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (2,'P003P001',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (2,'P003P002',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (2,'F002P002',1);

INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (3,'A001P002',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (3,'A001P003',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (3,'F002P001',1);

INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (4,'A001P003',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (4,'P003P001',1);

INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (5,'F002P002',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (5,'F002P003',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (5,'P003P002',1);

INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (6,'P003P002',1);

INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (7,'P003P001',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (7,'A001P001',1);

INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (8,'F002P001',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (8,'A001P002',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (8,'P003P002',1);

INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (9,'F002P003',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (9,'F002P002',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (9,'A001P003',1);
INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (9,'F002P001',1);

INSERT INTO detalle_facturas(id_factura,id_producto,cantidad_producto)
VALUES (10,'P003P001',1);


--Parte 3 (consultas)
--1.1 ¿Que cliente realizó la compra más cara?
SELECT nombre_cliente, precio_total FROM facturas INNER JOIN clientes ON facturas.id_cliente = clientes.id_cliente  WHERE precio_total=(SELECT max(precio_total) FROM facturas);

--nombre_cliente | precio_total 
----------------+--------------
 --Francisco      |        15.47
--(1 row)

--¿Que cliente pagó sobre 10 de monto? Lo cambié a 10, ya que mis precios son muy bajos
SELECT nombre_cliente, precio_total FROM facturas INNER JOIN clientes ON facturas.id_cliente = clientes.id_cliente  WHERE precio_total > 10;

 --nombre_cliente | precio_total 
----------------+--------------
 --Francisco      |        15.47
 --Elena          |        13.09
--(2 rows)

--¿Cuantos clientes han comprado el producto 6 (Mi producto 6 es la 'Lechuga Costina', id 'F002P003').

SELECT COUNT (DISTINCT id_cliente) FROM (SELECT id_producto, id_cliente FROM detalle_facturas INNER JOIN facturas ON detalle_factura.id_producto = 'F002P003') AS n;
 
 --count 
-------
  --   4
--(1 row)



--CREAR LA BASE DE DATOS
CREATE DATABASE SISTEMA_VENTAS;
--USAR LA BASE DE DATOS
USE SISTEMA_VENTAS;
--CREAR TABLAS
--TABLA CATEGORIA
CREATE TABLE CATEGORIA (
 idCategoria int identity primary key,
 nombre varchar (40) not null
)
--TABLA EMPLEADO 
CREATE TABLE EMPLEADO (
 idEmpleado varchar(15) primary key,
 nombre varchar (30) not null,
 fecha_nacimiento date not null,
 direccion varchar(30) not null,
 telefono varchar (30) not null
)
--TABLA CLIENTE
CREATE TABLE CLIENTE (
 idCliente varchar(15) primary key,
 nombre varchar(30) not null,
 fecha_nacimiento date not null,
 direccion varchar(30) not null,
 telefono varchar(30) not null
)
--TABLA PROVEEDOR
CREATE TABLE PROVEEDOR (
 idProveedor varchar(15) primary key,
 nombre varchar(30) not null
)
--TABLA PRODUCTO
CREATE TABLE PRODUCTO (
 codP varchar(15) primary key,
 nombre varchar (40) not null,
 valor_venta float not null,
 existencia varchar(12) not null,
 idCategoria_fk int identity,
 foreign key (idCategoria_fk) references CATEGORIA (idCategoria)
)
--TABLA TELEFONO-PROVEEDOR
CREATE TABLE TEL_PRO (
 idProveedor_fk varchar(15),
 telefono varchar(30) not null,
 foreign key (idProveedor_fk) references PROVEEDOR (idProveedor)
)
--TABLA FACTURA_VENTA
CREATE TABLE FACTURA_VENTA (
 nFacturaV int identity primary key,
 fecha datetime not null,
 iva float null,
 subTotal float null,
 total float null,
 idEmpleado_fk varchar(15),
 idCliente_fk varchar(15),
 foreign key (idEmpleado_fk) references EMPLEADO (idEmpleado),
 foreign key (idCliente_fk) references CLIENTE (idCliente)
)
--TABLA FACTURA_COMPRA
CREATE TABLE FACTURA_COMPRA (
  nFacturaC varchar(15) primary key,
  fecha datetime not null,
  iva float null,
  subtotal float null,
  total float null,
  idEmpleado_fk varchar(15),
  idProveedor_fk varchar(15),
  foreign key (idEmpleado_fk) references EMPLEADO (idEmpleado),
  foreign key (idProveedor_fk) references PROVEEDOR (idProveedor)
)
--TABLA PRODUCTO-FACTURA_VENTA
CREATE TABLE PROD_FAC_V (
  nFacturaV_fk int identity,
  codP_fk varchar(15),
  foreign key (nFacturaV_fk) references FACTURA_VENTA (nFacturaV),
  foreign key (codP_fk) references PRODUCTO (codP),
  primary key (codP_fk, nFacturaV_fk)
)
--TABLA PRODUCTO-FACTURA_COMPRA
CREATE TABLE PROD_FAC_C (
  costo float null,
  cant int not null,
  nFacturaC_fk varchar(15),
  codP_fk varchar(15),
  foreign key (nFacturaC_fk) references FACTURA_COMPRA (nFacturaC),
  foreign key (codP_fk) references PRODUCTO (codP),
  primary key (nFacturaC_fk,codP_fk) 
)

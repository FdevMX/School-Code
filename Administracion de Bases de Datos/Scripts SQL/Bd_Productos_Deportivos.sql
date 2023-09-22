-- Base de Datos Productos Deportivos --


Create Database Bd_Productos_Deportivos;



Use Bd_Productos_Deportivos;

Create table region 
(id_region numeric(7) PRIMARY KEY,
 nombre char(50) not null);

Create table departamento
(id_dep numeric(7) primary key,
 nombre char(50) not null,
 id_region numeric(7), 
 Foreign key (id_region) references region(id_region)
);

Create table Producto(
  id_producto numeric(7) Primary Key,
  nombre Varchar(50) not null,
  precio numeric(11,2),
  unidad Char(25));


Create table empleado(
id_empleado numeric(7) PRIMARY KEY,
paterno char(50) not null,
materno char(50),
nombre  char(50),
userid  char(20) not null,
comentarios varchar(255),
id_director numeric(7), 
Foreign Key(id_director) References Empleado(id_empleado),
puesto varchar (30),
id_dep numeric(7),
sueldo numeric(11,2),
pct_comision numeric(5,2),
fec_ingreso date);


 Create Table Almacen(
  id_almacen numeric(7) Primary Key,
  id_region numeric(7) not null, Foreign Key (id_region) References Region(id_region),
  Calle Char(50),
  Ciudad Char(50),
  Estado Char(50),
  Pais Char(50),
  Cp Char(6),
  Telefono char(20),
  id_gerente numeric(7), Foreign Key (id_gerente) References Empleado(id_empleado));


Create Table Cliente( 
  id_cliente Numeric(7) Primary Key,
  nombre Char(50) not null,
  telefono Char(20),
  calle Char(50),
  colonia Char(50),
  ciudad Char(50),
  estado Char(50),
  pais Char(50),
  cp Char(50),
  credito_autorizado numeric(11,2),
  id_rep_ventas numeric(7), 
  FOREIGN KEY(id_rep_ventas) REFERENCES empleado(id_empleado),
  id_region numeric(7), 
  FOREIGN KEY(id_region) REFERENCES region(id_region),
  comentarios Char(255));

 Create table Orden(
  id_orden numeric(7) Primary key,
  id_cliente numeric(7) not null, foreign key(id_cliente) REFERENCES cliente(id_cliente),
  fecha_orden date,
  fecha_envio date,
  id_rep_ventas numeric(7), FOREIGN KEY(id_rep_ventas) REFERENCES empleado(id_empleado),
  total Numeric(11,2),
  tipo_pago Char(10),
  orden_llena Char(1));


Create table detalle_orden(id_orden numeric(7),
  consecutivo numeric(7),
  id_producto numeric(7), FOREIGN KEY(id_producto) REFERENCES producto(id_producto),
  precio numeric(11,2),
  cantidad numeric(7),
  cant_enviada numeric(7),
  Primary key(id_orden,consecutivo));

 Create Table Inventario(
 id_producto numeric(7), Foreign Key (id_producto) References Producto(id_producto),
 id_almacen numeric(7), Foreign Key (id_almacen) References Almacen(id_almacen),
 cant_stock numeric(7), 
 punto_reorden numeric(7),
 max_stock numeric(7) not null,
 observ_stock varchar(255),
 Fecha_reorden date,
 Primary Key(id_producto,id_almacen));
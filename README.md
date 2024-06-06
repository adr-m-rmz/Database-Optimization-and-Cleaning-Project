# Optimizacion y limpieza de base de datos
Optimización de base de datos en Microsoft SQL Server Management Studio

## **Esquema de Tablas**

### clientes:

-cliente_id (INT): Identificador único del cliente.
-nombre (NVARCHAR(100)): Nombre del cliente.
-correo (NVARCHAR(100)): Correo electrónico del cliente.
-telefono (NVARCHAR(20)): Número de teléfono del cliente.

### Productos:

#### producto_id (INT): Identificador único del producto.
#### nombre_producto (NVARCHAR(100)): Nombre del producto.
#### categoria (NVARCHAR(50)): Categoría del producto.
#### precio (DECIMAL(10, 2)): Precio del producto.

### Ventas:

-venta_id (INT): Identificador único de la venta.
-cliente_id (INT): Clave foránea que referencia al cliente.
-producto_id (INT): Clave foránea que referencia al producto.
-fecha_venta (DATE): Fecha de la venta.
-cantidad (INT): Cantidad de productos vendidos.
-total (DECIMAL(10, 2)): Total de la venta.

**Lógica de Negocio**

Las ventas están asociadas a clientes y productos mediante claves foráneas en la tabla ventas.
Cada venta registra la fecha de venta, la cantidad de productos vendidos y el total de la venta.
Los clientes y productos tienen información básica como nombre, correo, categoría, etc.
Las relaciones entre las tablas están diseñadas para mantener la integridad referencial y asegurar la consistencia de los datos.

**Procesos de Limpieza y Optimización**

Eliminación de duplicados en la tabla ventas:

Se utiliza una consulta SQL que busca duplicados en la tabla ventas basándose en varios criterios como cliente_id, producto_id, fecha_venta, etc.
Se elimina automáticamente los duplicados utilizando la cláusula DELETE y una subconsulta para identificar los registros duplicados.

Índices para mejorar el rendimiento:

Se crea índice en las columnas más consultada, producto_id en la tabla ventas, para mejorar el rendimiento de las consultas.
Se documenta la razón de la creación del índice.

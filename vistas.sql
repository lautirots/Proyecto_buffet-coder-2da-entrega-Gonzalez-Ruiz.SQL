--Creamos esta vista la cual nos ayuda para simplificar consultas, mejorar la seguridad y organizar mejor los datos. 
--En este caso para nuestra base de datos de un buffet,
--levantamos una vista para obtener detalles de todos los pedidos con información de clientes y empleados,
--asi poder tener seguimiento agil tanto del dinero que sale como  del que entra.

CREATE VIEW VistaPedidos AS
SELECT 
    p.idPedido, 
    p.fecha, 
    c.nombre AS nombre_cliente, 
    e.nombre AS nombre_empleado
FROM 
    Pedidos p
JOIN 
    Clientes c ON p.id_cliente = c.idCliente
JOIN 
    Empleados e ON p.id_empleado = e.idEmpleado;
--Tambien me parecio necesario agregar otra vista,
--para obtener las reservaciones con información del cliente y de la mesa a utilizar,
--evitando asi reservar por ejemplo la misma mesa en el mismo horario,
--de esta manera poder tener mas organizacion dentro del establecimiento.
    
CREATE VIEW VistaReservaciones AS
SELECT 
    r.idReservacion, 
    c.nombre AS nombre_cliente, 
    m.numero_mesa, 
    r.fecha_reservacion, 
    r.hora_reservacion, 
    r.numero_personas
FROM 
    Reservaciones r
JOIN 
    Clientes c ON r.idCliente = c.idCliente
JOIN 
    Mesas m ON r.idMesa = m.idMesa;
    
    SET GLOBAL log_bin_trust_function_creators = 1;

--Esta vista te permite ver qué ingredientes se necesitan para cada plato junto con la cantidad requerida.
    
CREATE VIEW Vista_Platos_Ingredientes AS
SELECT 
    p.nombre AS Plato,
    i.nombre AS Ingrediente,
    pi.cantidad_necesaria AS Cantidad_Necesaria,
    i.unidad_medida AS Unidad
FROM 
    Platos p
JOIN 
    Plato_Ingredientes pi ON p.idPlato = pi.idPlato
JOIN 
    Ingredientes i ON pi.idIngrediente = i.idIngrediente;

--Esta vista muestra la receta de cada plato con sus pasos, tiempo de preparación y dificultad.

    CREATE VIEW Vista_Recetas_Detalladas AS
SELECT 
    p.nombre AS Plato,
    r.pasos AS Pasos,
    r.tiempo_preparacion AS Tiempo_Preparacion,
    r.dificultad AS Dificultad
FROM 
    Recetas r
JOIN 
    Platos p ON r.idPlato = p.idPlato;

--Lista todos los platos junto con su descripción, precio y la categoría a la que pertenecen.
CREATE VIEW Vista_Platos_Categorias AS
SELECT 
    c.nombre AS Categoria,
    p.nombre AS Nombre_Plato,
    p.descripcion AS Descripcion_Plato,
    p.precio AS Precio_Plato
FROM 
    Platos p
JOIN 
    Categorias c ON p.idCategoria = c.idCategoria
ORDER BY 
    c.nombre, p.nombre;








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

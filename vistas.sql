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

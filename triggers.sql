--Este trigger se activará después de que se inserte un nuevo registro en la tabla DetallesPedido
--y actualizará la tabla Inventarios, asi disminuir la cantidad del plato correspondiente.
--esto nos permitira llevar un stock minucioso de nuestra carta.


DELIMITER //

CREATE TRIGGER ActualizarInventarioDespuesDeInsertar
AFTER INSERT ON DetallesPedido
FOR EACH ROW
BEGIN
    UPDATE Inventarios
    SET cantidad = cantidad - NEW.cantidad
    WHERE idPlato = NEW.idPlato;
END //

DELIMITER ;



--Actualizar la Fecha de Última Visita en la Tabla de Fidelización
--Este trigger actualiza la fecha de la última visita en la tabla Clientes_Fidelizacion
--cada vez que se inserta un nuevo pedido del cliente.

DELIMITER $$

CREATE TRIGGER ActualizarFechaUltimaVisita
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    -- Actualizar la fecha de la última visita del cliente
    UPDATE Clientes_Fidelizacion
    SET fecha_ultima_visita = NEW.fecha
    WHERE idCliente = NEW.id_cliente;
END$$

DELIMITER ;


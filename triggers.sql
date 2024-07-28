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


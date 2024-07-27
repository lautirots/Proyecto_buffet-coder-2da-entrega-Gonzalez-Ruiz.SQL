

DELIMITER //

CREATE PROCEDURE AgregarCliente(
    IN nombre VARCHAR(100),
    IN telefono VARCHAR(20),
    IN email VARCHAR(100)
)
BEGIN
    INSERT INTO Clientes (nombre, telefono, email)
    VALUES (nombre, telefono, email);
END //

DELIMITER ;

--levantamos un procedimiento,
--el cual nos permitira agregar de manera mas facil la insercion de nuevos clientes a nuestra tabla,
--Lo cual nos garantiza darnos la informacion de la cantidad de comensales que podemos recibir en el establecimiento,
--Con mayor precision, Asi garantizar una correcta organizacion.
--(Tablas manpiludas: "clientes")

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

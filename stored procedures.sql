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

--levantamos un procedimiento,
--el cual nos permitira agregar de manera mas facil la insercion de nuevos platos,
--(Tablas manpiludas: "platos")

DELIMITER $$

CREATE PROCEDURE AgregarPlato(
    IN nombrePlato VARCHAR(100),
    IN descripcionPlato TEXT,
    IN precioPlato DECIMAL(10, 2),
    IN idCategoriaPlato INT
)
BEGIN
    -- Insertar el nuevo plato en la tabla Platos
    INSERT INTO Platos (nombre, descripcion, precio, idCategoria)
    VALUES (nombrePlato, descripcionPlato, precioPlato, idCategoriaPlato);
END$$

DELIMITER ;


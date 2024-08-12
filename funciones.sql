--esta funcion tiene el fin de Calcular el total de ingresos por categoría en un rango de fechas,
--calculanfo el total de ingresos generados por una categoría específica de platos en un rango de fechas dado,
--con el objetivo de Analizar los ingresos generados por diferentes categorías de platos en un periodo determinado.
--(Tablas manipuladas: DetallesPedido, Platos, Categorias)

DELIMITER //

CREATE FUNCTION IngresosPorCategoria(idCategoria INT, fechaInicio DATE, fechaFin DATE)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2) DEFAULT 0;
    SELECT SUM(dp.cantidad * p.precio)
    INTO total
    FROM DetallesPedido dp
    JOIN Platos p ON dp.idPlato = p.idPlato
    JOIN Categorias c ON p.idCategoria = c.idCategoria
    JOIN Pedidos ped ON dp.PedidoID = ped.idPedido
    WHERE c.idCategoria = idCategoria
      AND ped.fecha BETWEEN fechaInicio AND fechaFin;
    RETURN total;
END //

DELIMITER ;

DELIMITER //

    
--Descripción de la Función ObtenerPrecioPlato
--Nombre de la función: ObtenerPrecioPlato
--Parámetro de entrada:

--idPlato (INT): Es el identificador único del plato del cual se desea obtener el precio.
--Este identificador es clave primaria en la tabla Platos.
--Tipo de retorno:

--DECIMAL(10, 2): La función devuelve un valor decimal con hasta 10 dígitos, de los cuales 2 son decimales.
--Representa el precio del plato en formato monetario.
--Descripción funcional:

--La función ObtenerPrecioPlato tiene como objetivo retornar el precio de un plato específico identificado por idPlato.
--Primero, se declara una variable Precio de tipo DECIMAL(10, 2) que almacenará el valor del precio del plato.
--Esta variable se inicializa con un valor predeterminado de 0.
--A continuación, se realiza una consulta SELECT sobre la tabla Platos para extraer el precio (p.precio) del plato,
--cuyo idPlato coincide con el valor proporcionado como parámetro de entrada.
--El valor del precio obtenido se almacena en la variable Precio.
--Finalmente, la función retorna el valor almacenado en Precio. Si no se encuentra un plato con el idPlato especificado,
--la función devolverá 0 debido al valor predeterminado de la variable.
--Uso esperado:
--Esta función es útil en situaciones donde se necesita obtener rápidamente el precio de un plato específico en el sistema,
--por ejemplo, al calcular el total de un pedido o mostrar el precio de un plato en un menú interactivo.
    
DELIMITER $$

CREATE FUNCTION ObtenerPrecioPlato(idPlato INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE Precio DECIMAL(10, 2) DEFAULT 0;
    
    SELECT p.precio INTO Precio
    FROM Platos p
    WHERE p.idPlato = idPlato;

    RETURN Precio;
END$$

DELIMITER ;


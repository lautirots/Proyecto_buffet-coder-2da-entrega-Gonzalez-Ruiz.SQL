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

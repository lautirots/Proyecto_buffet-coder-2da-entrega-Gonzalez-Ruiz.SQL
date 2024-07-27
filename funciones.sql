--

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

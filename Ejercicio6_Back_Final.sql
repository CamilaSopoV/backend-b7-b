/*Punto 1: ID de los clientes de la Ciudad de Monterrey (It´s OK)*/ 
SELECT id_cliente FROM cliente WHERE "barrio" = 'Monterrey';

/*Punto 2: ID y descripción de los productos que cuesten menos de 15 pesos (OK)*/
SELECT SKU, descripción FROM productos_tienda WHERE precio < 15000;

/*Punto 3: ID y nombre de los clientes, cantidad vendida, y descripción del producto, en las ventas en las cuales se vendieron más de 10 unidades (OK) */

SELECT C.id_cliente AS "ID Cliente", C.nombre_cliente AS "Nombre Cliente", VP.cantidad, P.descripción AS "Descripción Producto"
FROM cliente C
JOIN ventas V ON C.id_cliente = V.id_cliente
JOIN ventas VP ON V.id_venta = VP.id_venta
JOIN productos_tienda P ON VP.SKU = P.SKU
WHERE VP.cantidad > 10;

/* Punto 4: ID y nombre de los clientes que no aparecen en la tabla de ventas (Clientes que no han comprado productos (it´s OK)*/
SELECT ID_cliente, nombre_cliente FROM cliente WHERE ID_cliente NOT IN (SELECT DISTINCT ID_cliente FROM ventas);

/*Punto 5: ID y nombre de los clientes que han comprado todos los productos de la empresa (It´s Ok)*/

SELECT c.ID_cliente, c.nombre_cliente
FROM cliente c
JOIN (
    SELECT v.id_cliente, COUNT(DISTINCT v.sku) AS num_distinct_skus
    FROM ventas v
    GROUP BY v.id_cliente
) cliente_skus ON c.ID_cliente = cliente_skus.id_cliente
JOIN (
    SELECT COUNT(DISTINCT sku) AS total_distinct_skus
    FROM ventas
) total_skus ON cliente_skus.num_distinct_skus >= total_skus.total_distinct_skus;

/*Punto 6: ID y nombre de cada cliente y la suma total (suma de cantidad) de los productos que ha comprado (OK)*/
SELECT C.id_cliente, C.nombre_cliente, SUM(VP.cantidad) AS "Total productos comprados"
FROM cliente C
LEFT JOIN ventas V ON C.id_cliente = V.id_cliente
LEFT JOIN ventas VP ON V.id_venta = VP.id_venta
GROUP BY C.id_cliente, C.nombre_cliente;

/*Punto 7: ID de los productos que no han sido comprados por clientes de Guadalajara (OK)*/

SELECT P.sku FROM productos_tienda P
WHERE NOT EXISTS (
    SELECT 1 FROM ventas VP
    JOIN ventas V ON VP.id_venta = V.id_venta
    JOIN cliente C ON V.ID_cliente = C.ID_cliente
    WHERE "barrio" = 'Guadalajara' AND VP.sku = P.sku
);

/*Punto 8: ID de los productos que se han vendido a clientes de Monterrey y que también se han vendido a clientes de Cancún (OK)*/
SELECT DISTINCT VP.sku
FROM ventas VP
JOIN ventas V ON VP.id_venta = V.id_venta
JOIN cliente C ON V.ID_cliente = C.ID_cliente
WHERE "barrio" = 'Monterrey'
AND EXISTS (
    SELECT FROM ventas VP2
    JOIN ventas V2 ON VP2.id_venta = V2.id_venta
    JOIN cliente C2 ON V2.id_cliente = C2.id_cliente
    WHERE "barrio" = 'Cancún' AND VP2.sku = VP.sku
);

/*Punto 9: Nombre de las ciudades en las que se han vendido todos los productos (It´s Ok)*/

SELECT c.barrio
FROM cliente c
JOIN (
    SELECT v.id_cliente, COUNT(DISTINCT v.sku) AS num_distinct_skus
    FROM ventas v
    GROUP BY v.id_cliente
) cliente_skus ON c.ID_cliente = cliente_skus.id_cliente
JOIN (
    SELECT COUNT(DISTINCT sku) AS total_distinct_skus
    FROM ventas
) total_skus ON cliente_skus.num_distinct_skus >= total_skus.total_distinct_skus;


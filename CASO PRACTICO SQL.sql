-- ================================================================
-- CONTEXTO
-- El restaurante "Sabores del Mundo", es conocido por su auténtica cocina y su ambiente acogedor.
-- Este restaurante lanzó un nuevo menú a principios de año y ha estado recopilando
-- información detallada sobre las transacciones de los clientes para identificar áreas de
-- oportunidad y aprovechar al máximo sus datos para optimizar las ventas.

-- OBJETIVO
-- Identificar cuáles son los productos del menú que han tenido más éxito y cuáles son los que
-- menos han gustado a los clientes.
-- ================================================================

-- a) Crear la base de datos con el archivo create_restaurant_db.sql (ya ejecutado)

-- b) Exploración de la tabla "menu_items"
	SELECT * FROM menu_items;
-- 1. Encontrar el número de artículos en el menú. R=32

SELECT COUNT(*) AS total_articulos FROM menu_items;


-- 2.  ¿Cuál es el artículo menos caro y el más caro en el menú?

--Artículo menos caro R= "Edamame"	5.00

SELECT item_name, price FROM menu_items ORDER BY price ASC LIMIT 1;

-- Artículo más caro R= "Shrimp Scampi"	19.95

SELECT item_name, price FROM menu_items ORDER BY price DESC LIMIT 1;

-- 3. ¿Cuántos platos americanos hay en el menú? R=6
SELECT COUNT(*) AS platos_americanos FROM menu_items WHERE category = 'American';

-- 4.  ¿Cuál es el precio promedio de los platos? R=13.29
SELECT ROUND(AVG(price), 2) AS precio_promedio FROM menu_items;

-- c) Exploración de la tabla "order_details"

SELECT * FROM order_details;

-- 1. ¿Cuántos pedidos únicos se realizaron en total? R=5370
SELECT COUNT(DISTINCT order_id) AS pedidos_unicos FROM order_details;

-- 2. ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos? R= 
/*	440		14
	2675	14
	3473	14
	4305	14
	443		14*/
SELECT order_id, COUNT(*) AS total_articulos
FROM order_details
GROUP BY order_id
ORDER BY total_articulos DESC
LIMIT 5;

-- 3. ¿Cuándo se realizó el primer pedido y el último pedido? R= primer pedido "2023-01-01" Y último pedido "2023-03-31"
SELECT MIN(order_date) AS primer_pedido, MAX(order_date) AS ultimo_pedido FROM order_details;

-- 4. ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'? R=308
SELECT COUNT(DISTINCT order_id) AS pedidos_rango
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';

-- d) LEFT JOIN entre order_details y menu_items
SELECT od.*, mi.item_name, mi.category, mi.price
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id;

-- e) ANÁLISIS ADICIONAL 5 PUNTOS CLAVE
-- 1. Artículos más vendidos (Top 5)
SELECT mi.item_name, COUNT(*) AS veces_vendido
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY veces_vendido DESC
LIMIT 5;

-- 2. Categorías más populares
SELECT mi.category, COUNT(*) AS cantidad_vendida
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.category
ORDER BY cantidad_vendida DESC;

-- 3. Artículos con mayores ingresos
SELECT mi.item_name, ROUND(SUM(mi.price), 2) AS ingresos_totales
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY ingresos_totales DESC
LIMIT 5;

-- 4. Artículos con menor rotación (menos pedidos)
SELECT mi.item_name, COUNT(*) AS veces_vendido
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY veces_vendido ASC
LIMIT 5;

-- 5. Promedio de artículos por pedido
SELECT ROUND(AVG(total_items), 2) AS promedio_articulos_por_pedido
FROM (
  SELECT order_id, COUNT(*) AS total_items
  FROM order_details
  GROUP BY order_id
) AS sub;

-- ================================================================
-- CONCLUSIONES RECOMENDADAS PARA LOS DUEÑOS
-- 1. Los artículos más vendidos deben mantenerse en el menú y promoverse más.
-- 2. La categoría más popular representa una oportunidad para ampliar la oferta.
-- 3. Algunos platos generan altos ingresos por unidad, ideales para combos premium.
-- 4. Los productos con menor rotación deben ser evaluados o eliminados.
-- 5. El promedio de artículos por pedido sugiere que se pueden aplicar estrategias de venta cruzada o combos.
-- ================================================================

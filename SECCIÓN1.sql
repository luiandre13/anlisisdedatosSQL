--SELECT: Recupera datos de una o varias tablas.

/*selecciona todas las columnas de las siguientes tablas:
actor, address, customer, film, payment, rental
para realizar un análisis exploratorio*/
SELECT * FROM actor;
SELECT * FROM address;
SELECT * FROM customer;
SELECT * FROM film;
SELECT * FROM rental;
SELECT * FROM payment;
--selecciona la columna: first_name de la tabla: actor
SELECT first_name FROM ACTOR;
--selecciona las columnas: first_name y last_name de la tabla:actor
SELECT first_name,last_name FROM ACTOR;
--selecciona la columna: district de la tabla: address
SELECT district FROM address;
--selecciona las columnas: first_name, last_name y email de la tabla: customer
SELECT first_name, last_name, email FROM customer;

--LIMIT: Restringe la cantidad de filas que se devuelven en una consulta.
--realiza la consulta anterior, limitando a 100 registros 
SELECT first_name, last_name, email
FROM customer
LIMIT 100;

--ORDER BY: Ordena los resultados, ya sea de forma ascendente o descendente.

/*selecciona las columnas: first_name y last_name de la tabla: actor + ordénala de forma ascendente
con base en la columna: first_name*/
SELECT first_name,last_name FROM ACTOR ORDER BY first_name ASC;

--realiza la consulta anterior,y ahora ordénala de forma descendente
SELECT first_name,last_name FROM ACTOR ORDER BY first_name DESC;

/*realiza la consulta anterior, ahora ordenando por las dos columnas: 
first_name de forma ascendente y last_name de forma descendente*/
SELECT first_name,last_name FROM ACTOR ORDER BY first_name ASC,last_name DESC;


--DISTINCT: Devuelve solo los valores únicos.
--selecciona los valores únicos de la columna: first_name de la tabla:actor
SELECT DISTINCT first_name FROM ACTOR;

--selecciona los valores únicos de la columna: rating de la tabla:film
SELECT DISTINCT rating FROM film;

--selecciona los valores únicos de la columna: rental_duration de la tabla:film
SELECT DISTINCT rental_duration FROM film;

/*selecciona las combinaciones únicas de las columnas: rating y rental_duration 
de la tabla: film*/
SELECT DISTINCT rating,rental_duration FROM film;

/*selecciona los valores únicos de la columna: amount, de la tabla: payment,
+ordénala de forma descendente con base en la columna:amount,
+limita a 1 registro para conocer la cantidad más alta de esa columna*/
SELECT DISTINCT amount FROM payment ORDER BY amount DESC LIMIT 1;

--COUNT: Cuenta el número de filas en un conjunto de resultados.
--selecciona el recuento de registros de la tabla: actor
SELECT COUNT(*) FROM ACTOR;
--selecciona el recuento de registros de la columna: first_name de la tabla: actor
SELECT COUNT(first_name) FROM ACTOR;
--selecciona el recuento de valores únicos de la columna: first_name de la tabla: actor
SELECT COUNT(DISTINCT first_name) FROM ACTOR;

--AS: Asigna alias a una columna o tabla.
--Realiza la consulta anterior, dándole un alias a la columna resultante= nombres_unicos o "nombres unicos"
SELECT COUNT(DISTINCT first_name) AS nombres_unicos FROM ACTOR;

--A RESOLVER.
/*1) ¿Cuántos valores únicos hay en la columna: district de la tabla: address?*/
SELECT COUNT (DISTINCT district) FROM address; /*RESPUESTA = 378*/

/*2) ¿Cuál es el primer registro de la columna: rental_date de la tabla:rental?,
esto para saber cuándo se rentó la primera pelicula*/
SELECT rental_date FROM rental ORDER BY rental_date ASC LIMIT 1; /*RESPUESTA = "2005-05-24 16:53:30-05"*/

/*3) ¿Cuántos valores únicos tiene la columna: title de la tabla:film?,
agrega un alias a la columna resultante: "recuento de peliculas unicas"
esto para saber cuántas peliculas diferentes tenemos*/
SELECT COUNT(DISTINCT title) AS "recuento de peliculas unicas" FROM film; /*RESPUESTA = 1000*/





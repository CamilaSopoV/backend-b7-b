/* 1. Selecciona las columnas film_id y title de la tabla film. */
SELECT film_id FROM film;

/* 2. Selecciona 5 filas de la tabla film, obteniendo todas las columnas. */
SELECT * FROM film Limit 5;

/* 3. Selecciona filas de la tabla film donde film_id sea menor que 4.*/
SELECT * FROM film WHERE film_id<4;

/* 4. Selecciona filas de la tabla film donde el rating sea PG o G.*/
SELECT * FROM film WHERE rating='PG'OR rating='G';

/* 5. Selecciona filas de la tabla actor donde el nombre sea Angela, Angelina o Audrey usando IN.*/
SELECT * FROM actor WHERE first_name in ('Angela','Angelina','Audrey');

/* 6. Obtén una lista de actores con el nombre Julia*/
SELECT * FROM actor WHERE first_name='Julia';

/* 7. Obtén una lista de actores con los nombres Chris, Cameron o Cuba.*/
SELECT first_name FROM actor WHERE first_name in ('Chris','Cameron','Cuba');

/*8. Selecciona la fila de la tabla customer para el cliente con el nombre Jamie Rice.*/
SELECT * FROM customer WHERE last_name='Rice'; 

/*9. Selecciona el monto y la fecha de pago de la tabla payment donde el monto pagado sea menor a $1.*/
SELECT amount, payment_date FROM payment WHERE amount <1;

/*10.¿Cuáles son las diferentes duraciones de alquiler permitidas por la tienda?*/
SELECT (return_date)-(rental_date) as resultado FROM rental;

/*11. Ordena las filas en la tabla city por country_id y luego por city.*/
SELECT * FROM city ORDER BY country_id, city;

/*12. ¿Cuáles son los ID de los últimos 3 clientes que devolvieron un alquiler?*/
SELECT return_date, customer_id FROM rental ORDER BY return_date DESC OFFSET 183 LIMIT 3;

/*13. ¿Cuántas películas tienen clasificación NC-17? ¿Cuántas tienen clasificación PG o PG-13?*/
SELECT COUNT (*) AS clasificacion_NC17 FROM film WHERE rating='NC-17'; 
SELECT COUNT (*) AS clasificacion_pg_pg13 FROM film WHERE rating='PG' OR rating='PG-13';

/*14. ¿Cuántos clientes diferentes tienen registros en la tabla rental?*/
SELECT COUNT (DISTINCT customer_id) AS cantidad_clientes_diferentes FROM rental;

/*15. ¿Hay algún cliente con el mismo apellido? Respuesta: No hay clientes con el mismo apellido*/
SELECT last_name FROM customer GROUP BY last_name HAVING COUNT (DISTINCT customer_id)>1;

/*16. ¿Qué película (id) tiene la mayor cantidad de actores? Respuesta: Film ID 508*/
SELECT film_id,COUNT(DISTINCT actor_id) AS id_pelicula_mayor_cantidad from film_actor GROUP BY film_id ORDER BY id_pelicula_mayor_cantidad DESC;

/*17. ¿Qué actor (id) aparece en la mayor cantidad de películas?*/
SELECT actor_id, count (*) AS cantidad_peliculas FROM film_actor GROUP BY actor_id ORDER BY cantidad_peliculas DESC LIMIT 1;

/*18. Cuenta el número de ciudades para cada country_id en la tabla city. Ordena los resultados por count().*/
SELECT country_id ,COUNT(city) AS numero_ciudades FROM city group by country_id order by numero_ciudades desc;

/*19. ¿Cuál es la tarifa de alquiler promedio de las películas? ¿Puedes redondear el resultado a 2 decimales?*/
SELECT ROUND(AVG(amount),2) AS precio_promedio FROM payment;

/*20. Selecciona los 10 actores que tienen los nombres más largos (nombre y apellido combinados).*/
SELECT (first_name||''||last_name) AS nombre_completo, LENGTH (first_name||last_name) len FROM actor ORDER BY len DESC LIMIT 10;
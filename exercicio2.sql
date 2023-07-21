-- Crie uma consulta para cada consulta do exercício anterior que retorne o número de registros encontrados pela busca

SELECT COUNT(*) AS record_count
FROM (
    SELECT title, name FROM film f INNER JOIN category ca on f.film_id = ca.category_id
) AS subquery;


SELECT COUNT(*) AS record_count
FROM (
    SELECT f.title, a.first_name, COUNT(f.title) as movies
    FROM actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    INNER JOIN film f ON f.film_id = fa.film_id
    GROUP BY a.first_name, f.title
    ORDER BY movies, a.first_name DESC
) AS subquery;


SELECT COUNT(*) AS record_count
FROM (
    SELECT f.title, a.first_name, COUNT(f.title) as movies
    FROM actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    INNER JOIN film f ON f.film_id = fa.film_id
    WHERE f.length > 120
    GROUP BY a.first_name, f.title
    ORDER BY movies DESC
) AS subquery;

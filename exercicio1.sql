-- Faça uma consulta que retorne a lista de filmes e suas categorias correspondentes
SELECT title, name FROM film f INNER JOIN category ca on f.film_id = ca.category_id;

-- Faça uma consulta que retorne a lista de todos os atores com o número de filmes em que cada
--  ator participou. Ordene a lista pelo número de filmes, iniciando pelos atores que mais atuaram

SELECT f.title, a.first_name, COUNT(f.title) as movies
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
GROUP BY a.first_name, f.title
ORDER BY movies, a.first_name DESC;

-- Faça uma consulta que retorne a lista de atores que atuaram em filmes com mais de duas horas de duração (120 min)
--  ordene a lista pelo número de filmes que cada ator participou

SELECT f.title, a.first_name, COUNT(f.title) as movies
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
WHERE f.length > 120
GROUP BY a.first_name, f.title
ORDER BY movies DESC;
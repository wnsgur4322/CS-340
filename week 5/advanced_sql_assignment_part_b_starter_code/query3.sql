-- Find the first_name, last_name and total_combined_film_length of Sci-Fi films for every actor.
-- That is the result should list the names of all of the actors(even if an actor has not been in any Sci-Fi films) and the total length of Sci-Fi films they have been in.
-- Look at the category table to figure out how to filter data for Sci-Fi films.
-- Order your results by the actor_id in descending order.
-- Put query for Q3 here
SELECT actor.actor_id, actor.first_name, actor.last_name, COALESCE(sci_fi.sum, 0) AS total_combined_film_length
  FROM actor
  LEFT JOIN
    (SELECT actor.actor_id, SUM(film.length) AS sum FROM actor
      INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
      INNER JOIN film ON film_actor.film_id = film.film_id
      INNER JOIN film_category ON film.film_id = film_category.film_id 
      INNER JOIN category ON film_category.category_id = category.category_id
  WHERE category.name='Sci-Fi'
  GROUP BY actor.actor_id
  ORDER BY sum ASC)
  AS sci_fi ON actor.actor_id=sci_fi.actor_id
ORDER BY actor_id DESC;
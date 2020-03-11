-- Find the film_title of all films which feature both KIRSTEN PALTROW and WARREN NOLTE
-- Order the results by film_title in descending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box to figure out how to get a table that shows pairs of actors in movies.


-- Put your query for q5 here.
SELECT film.title AS film_title FROM film
  INNER JOIN film_actor ON film.film_id = film_actor.film_id
  INNER JOIN actor ON film_actor.actor_id = actor.actor_id
  INNER JOIN film_actor AS fa2 ON film.film_id = fa2.film_id
  INNER JOIN actor AS actor2 ON fa2.actor_id = actor2.actor_id
  WHERE ((actor.first_name='KIRSTEN' AND actor.last_name='PALTROW') AND (actor2.first_name='WARREN' AND actor2.last_name='NOLTE'))
GROUP BY film.title DESC; 
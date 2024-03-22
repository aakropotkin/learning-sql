-- ========================================================================== --
--
-- Chapter 9 Exercises
--
-- -------------------------------------------------------------------------- --

-- -------------------------------------------------------------------------- --
--
-- 9.1
-- Consruct a query against the `film' table that uses a filter condition with a
-- noncorrelated subquery against the `category' table to find all action films
-- ( `category.name' = 'Action' ).
--
-- -------------------------------------------------------------------------- --

SELECT title FROM film
WHERE ( SELECT category_id FROM film_category
        WHERE film_category.film_id = film.film_id
      ) = ( SELECT category_id FROM category WHERE name = 'Action' );


-- -------------------------------------------------------------------------- --


-- -------------------------------------------------------------------------- --
--
--
--
-- ========================================================================== --

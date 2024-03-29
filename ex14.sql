-- ========================================================================== --
--
-- Chapter 14 Exercises
--
-- -------------------------------------------------------------------------- --

use sakila;


-- -------------------------------------------------------------------------- --
--
-- 14.1
-- Create a view definition that matches the following output ( omitted ).
--
-- -------------------------------------------------------------------------- --

CREATE VIEW film_ctgry_actor AS
SELECT *
FROM film_actor fa
INNER JOIN film f           ON f.film_id = fa.film_id
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c       ON fc.category_id = category.category_id
INNER JOIN actor a          ON fa.actor_id = a.actor_id;


-- -------------------------------------------------------------------------- --
--
-- 14.2
-- The film rental company manager would like to have a report that includes the
-- name of every country, along with the total payments for all customers who
-- live in each country.
-- Generate a view definition that queries the `country' table and uses a scalar
-- subquery to calculate a value for a column named `tot_payments'.
--
-- -------------------------------------------------------------------------- --

-- TODO


-- -------------------------------------------------------------------------- --
--
--
--
-- ========================================================================== --

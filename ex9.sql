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

SELECT title
FROM film f
WHERE f.film_id IN (
  SELECT film_id
  FROM film_category fc
  INNER JOIN category c
    ON c.category_id = fc.category_id
  WHERE c.name = 'Action'
);



-- -------------------------------------------------------------------------- --
--
-- 9.2
-- Consruct a query against the `film' table that uses a filter condition with a
-- correlated subquery against the `category' table to find all action films
-- ( `category.name' = 'Action' ).
--
-- -------------------------------------------------------------------------- --

SELECT title
FROM film f
WHERE EXISTS (
  SELECT 1
  FROM film_category fc
  INNER JOIN category c
    ON c.category_id = fc.category_id
  WHERE ( fc.film_id = f.film_id ) AND
        ( c.name = 'Action' )
);

-- -------------------------------------------------------------------------- --
--
--
--
-- ========================================================================== --

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
-- 9.3
-- Join the following query to a subquery against the `film_actor' table to show
-- the level of each actor:
--
-- SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles
-- UNION ALL
-- SELECT 'Prolific Actor' level, 20 min_roles, 29 max_roles
-- UNION ALL
-- SELECT 'Newcomer' level, 1 min_roles, 19 max_roles;
--
-- The subquery against the `film_actor' table should count the number of rows
-- for each actor using `GROUP BY actor_id', and the count should be compared to
-- the `min_roles'/`max_roles' columns to determine which level each actor
-- belongs to.
--
-- -------------------------------------------------------------------------- --

SELECT a.actor_id, a.first_name, a.last_name, l.level
FROM actor a
INNER JOIN ( SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles
             UNION ALL
             SELECT 'Prolific Actor' level, 20 min_roles,    29 max_roles
             UNION ALL
             SELECT 'Newcomer'       level,  1 min_roles,    19 max_roles
           ) l
  ON ( SELECT count( * ) FROM film_actor fa
       WHERE a.actor_id = fa.actor_id
       GROUP BY actor_id
     ) BETWEEN l.min_roles AND l.max_roles;


-- -------------------------------------------------------------------------- --
--
--
--
-- ========================================================================== --

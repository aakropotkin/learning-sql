-- ========================================================================== --
--
-- Chapter 5 Exercises
--
-- -------------------------------------------------------------------------- --

use sakila;


-- -------------------------------------------------------------------------- --
--
-- 5.1
-- Fill in the blanks ( denoted by `<#>' ) for the following query to obtain the
-- results that follow:
--
-- SELECT c.first_name, c.last_name, a.address, ct.city
-- FROM customer c
--   INNER JOIN address <1>
--     ON c.address_id = a.address_id
--   INNER JOIN city ct
--     ON a.city_id = <2>
-- WHERE a.district = 'California';
--
-- +------------+-----------+------------------------+----------------+
-- | first_name | last_name | address                | city           |
-- +------------+-----------+------------------------+----------------+
-- | PATRICIA   | JOHNSON   | 1121 Loja Avenue       | San Bernardino |
-- | BETTY      | WHITE     | 770 Bydgoszcz Avenue   | Citrus Heights |
-- | ALICE      | STEWART   | 1135 Izumisano Parkway | Fontana        |
-- | ROSA       | REYNOLDS  | 793 Cam Ranh Avenue    | Lancaster      |
-- | RENEE      | LANE      | 533 al-Ayn Boulevard   | Compton        |
-- | KRISTIN    | JOHNSTON  | 226 Brest Manor        | Sunnyvale      |
-- | CASSANDRA  | WALTERS   | 920 Kumbakonam Loop    | Salinas        |
-- | JACOB      | LANCE     | 1866 al-Qatif Avenue   | El Monte       |
-- | RENE       | MCALISTER | 1895 Zhezqazghan Drive | Garden Grove   |
-- +------------+-----------+------------------------+----------------+
--
-- -------------------------------------------------------------------------- --

SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer c
  INNER JOIN address a
    ON c.address_id = a.address_id
  INNER JOIN city ct
    ON a.city_id = ct.city_id
WHERE a.district = 'California';


-- -------------------------------------------------------------------------- --
--
-- 5.2
-- Write a query that returns the title of every film in which an actor with the
-- first name 'JOHN' appears.
--
-- -------------------------------------------------------------------------- --

SELECT DISTINCT f.title
FROM film f
  INNER JOIN film_actor fa
    ON fa.film_id = f.film_id
  INNER JOIN actor a
    ON fa.actor_id = a.actor_id
WHERE a.first_name = 'JOHN';


-- -------------------------------------------------------------------------- --
--
-- 5.3
-- Construct a query that returns all addresses that are in the same city.
-- You will need to join the address table to itself, and each row should
-- include two different addresses.
--
-- -------------------------------------------------------------------------- --

SELECT a1.address, a2.address
FROM address a1
  INNER JOIN address a2
    ON a1.address_id != a2.address_id
WHERE a1.city_id = a2.city_id;


-- -------------------------------------------------------------------------- --
--
--
--
-- ========================================================================== --

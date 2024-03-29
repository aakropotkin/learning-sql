-- ========================================================================== --
--
-- Chapter 14 Exercises
--
-- -------------------------------------------------------------------------- --

use sakila;


-- -------------------------------------------------------------------------- --
--
-- 14.1
-- Create a view definition that matches the following output for the
-- following query statement:
--
-- SELECT title, category, first_name, last_name FROM film_ctgry_actor
-- WHERE last_name = 'FAWCETT';
--
-- +---------------------+---------------+------------+-----------+
-- | title               | category_name | first_name | last_name |
-- +---------------------+---------------+------------+-----------+
-- | ACE GOLDFINGER      | Horror        | BOB        | FAWCETT   |
-- | ADAPTATION HOLES    | Documentary   | BOB        | FAWCETT   |
-- | CHINATOWN GLADIATOR | New           | BOB        | FAWCETT   |
-- | CIRCUS YOUTH        | Children      | BOB        | FAWCETT   |
-- | CONTROL ANTHEM      | Comedy        | BOB        | FAWCETT   |
-- | DARES PLUTO         | Animation     | BOB        | FAWCETT   |
-- | DARN FORRESTER      | Action        | BOB        | FAWCETT   |
-- | DAZED PUNK          | Games         | BOB        | FAWCETT   |
-- | DYNAMITE TARZAN     | Classics      | BOB        | FAWCETT   |
-- | HATE HANDICAP       | Comedy        | BOB        | FAWCETT   |
-- | HOMICIDE PEACH      | Family        | BOB        | FAWCETT   |
-- | JACKET FRISCO       | Drama         | BOB        | FAWCETT   |
-- | JUMANJI BLADE       | New           | BOB        | FAWCETT   |
-- | LAWLESS VISION      | Animation     | BOB        | FAWCETT   |
-- | LEATHERNECKS DWARFS | Travel        | BOB        | FAWCETT   |
-- | OSCAR GOLD          | Animation     | BOB        | FAWCETT   |
-- | PELICAN COMFORTS    | Documentary   | BOB        | FAWCETT   |
-- | PERSONAL LADYBUGS   | Music         | BOB        | FAWCETT   |
-- | RAGING AIRPLANE     | Sci-Fi        | BOB        | FAWCETT   |
-- | RUN PACIFIC         | New           | BOB        | FAWCETT   |
-- | RUNNER MADIGAN      | Music         | BOB        | FAWCETT   |
-- | SADDLE ANTITRUST    | Comedy        | BOB        | FAWCETT   |
-- | SCORPION APOLLO     | Drama         | BOB        | FAWCETT   |
-- | SHAWSHANK BUBBLE    | Travel        | BOB        | FAWCETT   |
-- | TAXI KICK           | Music         | BOB        | FAWCETT   |
-- | BERETS AGENT        | Action        | JULIA      | FAWCETT   |
-- | BOILED DARES        | Travel        | JULIA      | FAWCETT   |
-- | CHISUM BEHAVIOR     | Family        | JULIA      | FAWCETT   |
-- | CLOSER BANG         | Comedy        | JULIA      | FAWCETT   |
-- | DAY UNFAITHFUL      | New           | JULIA      | FAWCETT   |
-- | HOPE TOOTSIE        | Classics      | JULIA      | FAWCETT   |
-- | LUKE MUMMY          | Animation     | JULIA      | FAWCETT   |
-- | MULAN MOON          | Comedy        | JULIA      | FAWCETT   |
-- | OPUS ICE            | Foreign       | JULIA      | FAWCETT   |
-- | POLLOCK DELIVERANCE | Foreign       | JULIA      | FAWCETT   |
-- | RIDGEMONT SUBMARINE | New           | JULIA      | FAWCETT   |
-- | SHANGHAI TYCOON     | Travel        | JULIA      | FAWCETT   |
-- | SHAWSHANK BUBBLE    | Travel        | JULIA      | FAWCETT   |
-- | THEORY MERMAID      | Animation     | JULIA      | FAWCETT   |
-- | WAIT CIDER          | Animation     | JULIA      | FAWCETT   |
-- +---------------------+---------------+------------+-----------+

--
-- -------------------------------------------------------------------------- --

CREATE VIEW film_ctgry_actor AS
SELECT fa.*, c.name AS category_name, a.*
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

CREATE VIEW country_payments AS
SELECT cn.country_id, cn.country, sum( p.amount ) AS tot_payments
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id
INNER JOIN address a  ON c.address_id = a.address_id
INNER JOIN city ct    ON a.city_id = ct.city_id
INNER JOIN country cn ON ct.country_id = cn.country_id
GROUP BY cn.country_id;


-- -------------------------------------------------------------------------- --
--
--
--
-- ========================================================================== --

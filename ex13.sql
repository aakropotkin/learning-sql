-- ========================================================================== --
--
-- Chapter 13 Exercises
--
-- -------------------------------------------------------------------------- --

use sakila;


-- -------------------------------------------------------------------------- --
--
-- 13.1
-- Generate an `alter table' statement for the `rental' table so that an error
-- will be raised if a row having a value found in the `rental.customer_id'
-- column is deleted from the `customer' table.
--
-- -------------------------------------------------------------------------- --

ALTER TABLE rental
ADD CONSTRAINT fk_rental_customer_id FOREIGN KEY ( customer_id )
REFERENCES customer ( customer_id ) ON DELETE RESTRICT;


-- -------------------------------------------------------------------------- --
--
-- 13.2
-- Generate a multicolumn index on the `payment' table that could be used by
-- both of the following queries:
--
-- SELECT customer_id, payment_date, amount
-- FROM payment
-- WHERE payment_date > cast( '2019-12-31 23:59:59' as datetime );
--
-- SELECT customer_id, payment_date, amount
-- FROM payment
-- WHERE ( payment_date > cast( '2019-12-31 23:59:59' as datetime ) )
--       AND ( amount < 5 );
--
-- -------------------------------------------------------------------------- --

CREATE INDEX idx_payment_date_and_amount
ON payment ( payment_date, amount );


-- -------------------------------------------------------------------------- --
--
--
--
-- ========================================================================== --

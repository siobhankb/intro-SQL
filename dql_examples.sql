-- ; tells SQL to 
-- Hellow World SQL Query, SELCTS ALL COLUMNS from actor table
select * from actor;

--Query for specific columns in the actor table
select first_name, last_name 
from actor;

--Use the where clause to filter rows
select *
from actor
where first_name = 'Nick';

--LIKE keyword can do a kind of regex 
select *
from actor
where first_name like 'Nick';

--LIKE keyword with wildcard(%)
select *
from actor
where first_name like 'N%';

select *
from actor
where first_name like '_a_';

--comparing operators are:
--Greater Than > -- Less than <
--Greater or equal >= -- Less or equal <=
--Not equal <>

--Explore data with SELECT * query (specifically when looking at new table)
select * from payment;

--Get all payments of more than $2.00
select *
from payment
where amount > 2;

--Get all payments btw 3 & 8
select *
from payment
where amount >= 3 and amount <= 8;

--Use BETWEEN clause with where
select *
from payment
where amount between 3 and 8;

--Order our rows of data by using the ORDER BY clause (defaults to ascending order)
select *
from payment
where amount between 3 and 8
order by amount;

--Order descending by adding 'DESC' to order by clause
select *
from payment
where amount between 3 and 8
order by amount DESC;

select customer_id, amount
from payment
where amount > 10;

select customer_id, amount, payment_date
from payment
where amount > 100
order by amount desc;

SELECT *
FROM payment;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()
SELECT sum(amount)
FROM payment;

-- get the total amount paid if the amount greater than $5
SELECT sum(amount) 
FROM payment
WHERE amount > 5;

--get average amount paid if the amount is greater than $5
SELECT avg(amount) 
FROM payment
WHERE amount > 5;

--get number of payments greater than $5
SELECT count(amount)
FROM payment
WHERE amount > 5;

-- can just use * bc count is just counting the rows where amount > 5
SELECT count(*)
FROM payment
WHERE amount > 5;

--alias our column names - AS keyword
SELECT max(amount) AS max_amount_paid
FROM payment
WHERE amount > 5;

--query different amounts
SELECT count(amount)
FROM payment
WHERE amount = 3.99;

--group by clause
SELECT amount, sum(amount), count(*)
FROM payment
GROUP BY amount;

--query the payment table to display the customers who have spent the most (aka order by sum amount)
SELECT customer_id, sum(amount), count(*) 
FROM payment
WHERE customer_id > 100
GROUP BY customer_id 
ORDER BY sum(amount) DESC;

--HAVING clause -> HAVING : GROUP BY :: WHERE : SELECT 
--query payment table for most amount
-- and who have made no more than 40 payments
SELECT customer_id, sum(amount), count(*)
FROM payment
GROUP BY customer_id 
HAVING count(*) <= 40
ORDER BY sum(amount) DESC;



--query to explore customer table
SELECT *
FROM customer;

--only show first n results
SELECT customer_id, sum(amount), count(*)
FROM payment
GROUP BY customer_id 
HAVING count(*) <= 10
ORDER BY sum(amount) DESC
LIMIT 5;

--start your rows after a certain amount of rows using the OFFSET clause
--ex: display customers 10-15 in terms of most spent under 40 purchases
SELECT customer_id, sum(amount), count(*)
FROM payment
GROUP BY customer_id 
HAVING count(*) <= 40
ORDER BY sum(amount) DESC
OFFSET 9 -- SKIP OVER FIRST 10 rows
LIMIT 5; -- limits TO ONLY showing 5 ROWS



--ORDER will always be:
SELECT 
FROM 
JOIN 
ON
WHERE 
GROUP BY 
HAVING 
ORDER BY 
OFFSET 
LIMIT 








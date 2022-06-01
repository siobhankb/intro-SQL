
--1. How many actors are there with the last name ‘Wahlberg’?
SELECT *
FROM actor
WHERE last_name = 'Wahlberg';

--Nick Wahlberg & Daryl Wahlberg


--2. How many payments were made between $3.99 and $5.99?
SELECT count(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
--ANSWER: 5,560


--3. What film does the store have the most of? (search in inventory)
--   (film id #)

SELECT film_id, count(*)
FROM inventory
GROUP BY film_id 
ORDER BY count(*) DESC;
-- ANSWER: film_id 200 has 9


--4. How many customers have the last name ‘William’?
SELECT last_name, count(*)
FROM customer
WHERE last_name = 'William'
GROUP BY last_name
ORDER BY count(*);
--Answer: 0
--BUT --> there is ONE entry with last name, 'Williams'
SELECT last_name, count(*)
FROM customer
WHERE last_name = 'Williams'
GROUP BY last_name
ORDER BY count(*);

SELECT *
FROM customer
WHERE last_name = 'Williams'
--Linda Williams

--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, count(*) AS num_sales
FROM payment
GROUP BY staff_id 
ORDER BY num_sales DESC;
--Answer: Staff #2 made 7,304 sales


--6. How many different district names are there?
--google unique count()
--DISTINCT 
SELECT count(DISTINCT district)
FROM address;
--Answer: 378


--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, count(*)
FROM film_actor
GROUP BY film_id 
ORDER BY count(*)DESC;
--Answer: film_id 508 has 16 actors in it


--8. From store_id 1, how many customers have a last name ending with ‘es’? 
--   (use customer table)
SELECT count(*)
FROM customer
WHERE last_name LIKE '%es';
--Answer: 21 customers have names ending in es
SELECT last_name, count(*)
FROM customer
WHERE last_name LIKE '%es'
GROUP BY last_name
ORDER BY last_name;
--alphabetically first is 'Bales' ... last is 'Wiles'


--9. How many payment amounts (4.99, 5.99, etc.) 
--   had a number of rentals above 250 for 
--   customers with ids between 380 and 430? (use group by and having > 250)

SELECT *
FROM payment
WHERE customer_id BETWEEN 380 AND 430
HAVING count(amount) > 250;

SELECT customer_id, count(*)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY customer_id 
ORDER BY count(*) DESC;

SELECT customer_id, count(*)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
HAVING count(amount) > 250 
ORDER BY count(*) DESC;

--10. (a) Within the film table, how many rating categories are there? 
SELECT count(DISTINCT rating) 
FROM film;
--Answer: There are 5 different ratings:
-- G, PG, PG-13, R, NC-17

--10. (b) And what rating has the most movies total?
SELECT rating, count(*)
FROM film
GROUP BY rating
ORDER BY count(rating) DESC;
--Answer: There are 223 PG-13 movies




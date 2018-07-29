USE sakila;

SELECT first_name, last_name
FROM actor;

SELECT CONCAT(first_name, ' ', last_name) AS 'Actor Name'
FROM actor;

SELECT * FROM actor
WHERE first_name = "Joe" ;

SELECT*FROM actor 
WHERE last_name LIKE '%GEN%';

SELECT*FROM actor 
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

ALTER TABLE actor 
ADD middle_name INT AFTER first_name;

ALTER TABLE actor
MODIFY COLUMN middle_name blob;

ALTER TABLE actor
DROP COLUMN middle_name;

SELECT COUNT(actor_id), last_name 
  FROM actor
 GROUP BY last_name HAVING COUNT(*)>=2
 ORDER BY COUNT(actor_id) DESC;

SET SQL_SAFE_UPDATES = 0;

UPDATE actor
SET first_name = 'HARPO'
WHERE first_name='GROUCHO';

UPDATE actor
SET first_name= IF (first_name='HARPO', 'GROUCHO','MUCHO GROUCHO')
WHERE actor_id=172;

SHOW CREATE TABLE address;

SELECT staff.first_name,staff.last_name,address.address
FROM staff 
INNER JOIN address
ON staff.address_id=address.address_id;

SELECT staff.first_name,staff.last_name,SUM(payment.amount) AS 'Total'
FROM payment 
INNER JOIN staff
ON staff.staff_id=payment.staff_id
GROUP BY payment.staff_id;

SELECT film.title,COUNT(film_actor.film_id) AS 'Actor Total'
FROM film_actor
INNER JOIN film
ON film.film_id=film_actor.film_id
GROUP BY film_actor.film_id;

SELECT COUNT(inventory.film_id) AS 'Copies'
FROM inventory
WHERE Inventory.film_id=439;

SELECT customer.first_name,customer.last_name,SUM(payment.amount) AS 'Total'
FROM customer
JOIN payment
ON customer.customer_id=payment.customer_id
GROUP BY customer.customer_id
ORDER BY customer.last_name ASC;

SELECT film.title
FROM film 
WHERE title LIKE 'K%' OR title LIKE 'Q%';

SELECT film_actor.actor_id,actor.first_name, actor.last_name
FROM film_actor
JOIN actor
ON actor.actor_id=film_actor.actor_id
WHERE film_actor.film_id=17;

SELECT customer.first_name,customer.last_name,customer.email
FROM customer
JOIN address
ON address.address_id=customer.address_id
JOIN city
ON city.city_id=address.city_id
WHERE city.country_id=20;

SELECT film.title
FROM film
JOIN film_category
ON film.film_id=film_category.film_id
WHERE film_category.category_id=8;

SELECT film.title,COUNT(rental.inventory_id) as 'Id_Count'
FROM rental
INNER JOIN inventory
ON rental.inventory_id=inventory.inventory_id
INNER JOIN film
ON inventory.film_id=film.film_id
GROUP BY rental.inventory_id
ORDER BY Id_Count DESC;

SELECT payment.staff_id, SUM(payment.amount) as 'Total'
FROM payment
GROUP BY payment.staff_id
ORDER BY Total ASC

SELECT store.store_id, city.city, country.country
FROM store
INNER JOIN address
ON store.address_id=address.address_id
INNER JOIN city
ON address.city_id=city.city_id
INNER JOIN country
ON city.country_id=country.country_id

SELECT category.name, SUM(payment.amount) as 'Gross'
FROM payment
INNER JOIN rental
ON payment.rental_id=rental.rental_id
INNER JOIN inventory
ON rental.inventory_id=inventory.inventory_id
INNER JOIN film_category
ON inventory.film_id=film_category.film_id
INNER JOIN category
ON category.category_id=film_category.category_id
GROUP BY category.name
ORDER BY Gross DESC;

CREATE VIEW le_sigh AS 
SELECT category.name, SUM(payment.amount) as 'Gross'
FROM payment
INNER JOIN rental
ON payment.rental_id=rental.rental_id
INNER JOIN inventory
ON rental.inventory_id=inventory.inventory_id
INNER JOIN film_category
ON inventory.film_id=film_category.film_id
INNER JOIN category
ON category.category_id=film_category.category_id
GROUP BY category.name
ORDER BY Gross DESC;

'lol no. Im an executive now. I delegated the remaining two tasks'




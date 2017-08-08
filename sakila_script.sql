-- 1) get all the customers inside city_id = 312? Your query should return customer first name, last name, email, and address.
SELECT customer.first_name, customer.last_name, customer.email, address.address 
from address -- One of 1 to Many relationship
JOIN customer ON address.address_id = customer.address_id -- Many of the 1-many relationship
WHERE address.city_id = 312;

-- 2) get all comedy films? Your query should return film title, description, release year, rating, 
-- special features, and genre (category).
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name
from film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE category.name = "comedy";
-- 3) get all the films joined by actor_id=5? Your query should return the actor id, actor name,
-- film title, description, and release year.
SELECT actor.actor_id, CONCAT(actor.first_name, " ", actor.last_name) AS actor_name, film.title, film.description, film.release_year
from actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE actor.actor_id = 5;
-- 4) get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)?
-- Your query should return customer first name, last name, email, and address.
SELECT customer.store_id, address.city_id, customer.first_name, customer.last_name, customer.email, address.address 
from address -- One of 1 to Many relationship
JOIN customer ON address.address_id = customer.address_id -- Many of the 1-many relationship
WHERE customer.store_id = 1 AND 
	(address.city_id = 1 OR address.city_id = 42 OR address.city_id =  312 OR address.city_id =  459);
-- 5) get all the films with a "rating = G" and "special feature = behind the scenes",
-- joined by actor_id = 15? Your query should return the film title, description, release year, rating, and special feature.
-- Hint: You may use LIKE function in getting the 'behind the scenes' part.
SELECT film.title, film.description, film.release_year, film.rating, film.special_features
from film
JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film.rating = "G" AND
	  film_actor.actor_id = 15 AND
      film.special_features LIKE "%behind the scenes%";

-- 6) get all the actors that joined in the film_id = 369? 
-- Your query should return the film_id, title, actor_id, and actor_name.
SELECT film.film_id, film.title, actor.actor_id, CONCAT(actor.first_name, " ", actor.last_name) AS actor_name
from film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE film.film_id = 369;
-- 7) get all drama films with a rental rate of 2.99?
-- Your query should return film title, description, release year, rating, special features, and genre (category).
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name
from film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE category.name = "drama" AND
	  film.rental_rate = 2.99;
-- 8) get all the action films which are joined by SANDRA KILMER?
-- Your query should return film title, description, release year, rating, special features, genre (category),
-- and actor's first name and last name.
SELECT CONCAT(actor.first_name, " ", actor.last_name) AS actor_name, film.title, film.description, film.release_year, film.rating, film.special_features, category.name, actor.first_name, actor.last_name
from film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE CONCAT(actor.first_name, " ", actor.last_name) = "Sandra Kilmer";
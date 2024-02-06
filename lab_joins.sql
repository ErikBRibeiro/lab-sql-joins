#did both ways to be easier to explain when someone asks help

SELECT 
    c.name AS category, 
    COUNT(f.film_id) AS number_of_films
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
JOIN film AS f ON fc.film_id = f.film_id
GROUP BY c.name;

SELECT 
    category.name AS category_name, 
    COUNT(film.film_id) AS number_of_films
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name;
#----------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    s.store_id, 
    ci.city, 
    co.country
FROM store AS s
JOIN address AS a ON s.address_id = a.address_id
JOIN city AS ci ON a.city_id = ci.city_id
JOIN country AS co ON ci.country_id = co.country_id;

SELECT 
    store.store_id, 
    city.city, 
    country.country
FROM store 
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;
#----------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    s.store_id, 
    SUM(p.amount) AS total_revenue
FROM store AS s
JOIN staff AS st ON s.store_id = st.store_id
JOIN payment AS p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

SELECT 
    store.store_id, 
    SUM(payment.amount) AS total_revenue
FROM store
JOIN staff ON store.store_id = staff.store_id
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;
#----------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    c.name AS category, 
    AVG(f.length) AS average_running_time
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
JOIN film AS f ON fc.film_id = f.film_id
GROUP BY c.name;

SELECT 
    category.name AS category, 
    AVG(film.length) AS average_running_time
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name;
#----------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    c.name AS category, 
    AVG(f.length) AS average_running_time
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
JOIN film AS f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY average_running_time DESC
LIMIT 1;

SELECT 
    category.name AS category, 
    AVG(film.length) AS average_running_time
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name
ORDER BY average_running_time DESC
LIMIT 1;
#----------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    f.title, 
    COUNT(r.rental_id) AS rental_count
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 10;

SELECT 
    film.title, 
    COUNT(rental.rental_id) AS rental_count
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY rental_count DESC
LIMIT 10;
#----------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    f.title, 
    i.store_id,
    CASE WHEN COUNT(i.inventory_id) > 0 THEN 'Yes' ELSE 'No' END AS available_for_rental
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
WHERE f.title = 'Academy Dinosaur' AND i.store_id = 1
GROUP BY f.title, i.store_id;

SELECT 
    film.title, 
    inventory.store_id,
    CASE WHEN COUNT(i.inventory_id) > 0 THEN 'Yes' ELSE 'No' END AS available_for_rental
FROM film
JOIN inventory ON film.film_id = inventory.film_id
WHERE film.title = 'Academy Dinosaur' AND inventory.store_id = 1
GROUP BY film.title, inventory.store_id;
#----------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    DISTINCT f.title,
    CASE 
        WHEN i.film_id IS NOT NULL THEN 'Available' 
        ELSE 'NOT available' 
    END AS availability_status
FROM film AS f
LEFT JOIN inventory AS i ON f.film_id = i.film_id;

SELECT 
    DISTINCT film.title,
    CASE 
        WHEN inventory.film_id IS NOT NULL THEN 'Available' 
        ELSE 'NOT available' 
    END AS availability_status
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id;
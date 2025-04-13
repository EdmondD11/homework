-- Get movies by rating (table-valued function)
SELECT * FROM movies

CREATE OR REPLACE FUNCTION get_movies_by_rating(movie_rating_param VARCHAR)
RETURNS TABLE(
	title VARCHAR(255),
	release_date DATE,
	duration_minutes INTEGER,
	rating mpaa_rating

)
AS $$
BEGIN 
RETURN QUERY 
SELECT 
m.title,
m.release_date,
m.duration_minutes,
m.rating
FROM movies m
WHERE m.rating=movie_rating_param::mpaa_rating;

END;
$$ LANGUAGE plpgsql;

DROP FUNCTION get_movies_by_rating(character varying)
SELECT * FROM get_movies_by_rating('PG-13')

--Get director's filmography (table-valued function)
SELECT * FROM directors
CREATE OR REPLACE FUNCTION get_director_filmograhpy(director_id_param INTEGER)
RETURNS TABLE(
	full_name VARCHAR(100),
	title VARCHAR(50),
	birth_date DATE,
	nationality VARCHAR(50)

)
AS $$ 
BEGIN 
RETURN QUERY 
SELECT CONCAT(d.first_name,' ',d.last_name)::VARCHAR(100) AS full_name,m.title,d.birth_date,d.nationality
FROM movies m
INNER JOIN directors d ON d.director_id=m.director_id
WHERE m.director_id=director_id_param;
END;
$$ LANGUAGE plpgsql;

 DROP FUNCTION get_director_filmograhpy(integer)
SELECT * FROM get_director_filmograhpy(2)

--Calculate actor's age

CREATE OR REPLACE FUNCTION calculate_actor_age(birth_date DATE)
RETURNS INTEGER
AS $$
BEGIN

    RETURN DATE_PART('year', AGE(CURRENT_DATE, birth_date))::INTEGER;
END;
$$ LANGUAGE plpgsql;

SELECT 
    first_name, 
    last_name, 
    birth_date, 
    calculate_actor_age(birth_date) AS age
FROM actors
WHERE birth_date IS NOT NULL;


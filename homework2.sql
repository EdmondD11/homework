--Show movies and their directors
SELECT m.title,d.first_name FROM movies m
INNER JOIN directors d ON d.director_id = m.director_id

--Show actors and their movies
SELECT a.first_name,a.last_name,m.title FROM cast_members cs
INNER JOIN actors a ON a.actor_id=cs.actor_id
INNER JOIN movies m ON m.movie_id=cs.movie_id

--Show movies and their genres
SELECT m.title,g.name FROM movie_genres mg
INNER JOIN movies m ON m.movie_id = mg.movie_id
INNER JOIN genres g ON g.genre_id=mg.genre_id

--Show all movies with budget over 100M and their production companies
SELECT * FROM movie_production_companies
SELECT m.title,pc.name,mpc.investment_amount FROM movie_production_companies mpc
INNER JOIN movies m ON m.movie_id=mpc.movie_id
INNER JOIN production_companies pc ON pc.company_id=mpc.company_id
WHERE investment_amount>1000000


--Show all movies with reviews rated 5 and their reviewers

SELECT * FROM reviews
SELECT m.title,u.username,r.rating FROM reviews r
INNER JOIN movies m ON m.movie_id=r.movie_id
INNER JOIN users u ON u.user_id=r.user_id
WHERE r.rating=8

--Show all Oscar-winning movies and their directors

SELECT m.title,d.first_name,a.award_type FROM movie_awards ma
INNER JOIN movies m ON m.movie_id = ma.movie_id
INNER JOIN directors d ON d.director_id=m.director_id
INNER JOIN awards a ON a.award_id = ma.award_id
WHERE award_type='Oscar'



--Find all genres that have more than 3 movies with a rating of 'R'
SELECT g.name,COUNT(*) FROM genres g
INNER JOIN movie_genres mg ON g.genre_id=mg.genre_id
INNER JOIN movies m ON m.movie_id=mg.movie_id
WHERE m.rating='R'
GROUP BY g.name
HAVING COUNT(*)>3

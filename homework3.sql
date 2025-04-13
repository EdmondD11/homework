--Create a view that shows top-rated movies. Include: movie title, averagerating, review count, director name
CREATE VIEW top_rated_movies AS
SELECT
m.title,AVG(r.rating) AS average_rating,COUNT(r.review_id) AS review_count,CONCAT(d.first_name,d.last_name) AS director_name FROM reviews r
INNER JOIN movies m ON m.movie_id=r.movie_id
INNER JOIN directors d ON d.director_id=m.director_id
GROUP BY m.title,director_name;

SELECT * FROM top_rated_movies

--Create a view for movie financial performance. Include: movie title, budget,total revenue, profit, ROI
CREATE VIEW financial_performance AS 
SELECT m.title,m.budget,mr.international_revenue,mr.international_revenue - m.budget AS profit,mr.international_revenue - m.budget/100 AS roi FROM movie_revenues mr
INNER JOIN movies m ON m.movie_id=mr.movie_id


SELECT * FROM financial_performance

--Create a view for actor filmography. Include: actor name, movie count, genrelist, total revenue

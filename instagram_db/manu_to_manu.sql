CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);


CREATE TABLE series(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4),
    genre VARCHAR(100)
    
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);
-- CHALLENGE 1, 2
SELECT 
    title, 
    AVG(rating) AS AVG
FROM series
JOIN reviews
    ON series.id = reviews.series_id
ORDER BY AVG;
    -- CHALLENGE 1, 2

SELECT 
    title, 
    AVG(rating) AS rat
FROM series
JOIN reviews
    ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY rat;

-- CHALLENGE 3 !!!

SELECT 
    first_name,
    last_name,
    rating
FROM reviewers
JOIN reviews
    ON reviewers.id = reviews.reviewer_id ;
    
    -- CHALLENGE 4
SELECT 
    title,
    rating
FROM series
LEFT JOIN reviews
    ON series.id = reviews.series_id
WHERE rating IS NULL ;

    -- CHALLENGE 5
SELECT 
    genre,
    AVG(rating)
FROM series
LEFT JOIN reviews
    ON series.id = reviews.series_id
GROUP BY genre ;


    -- CHALLENGE 6
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS count,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    IFNULL(AVG(rating), 0) AS AVG,
    IF(COUNT(rating) >=1, 'ACTIVE', "INACTIVE") AS COOOO
FROM reviewers
LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;
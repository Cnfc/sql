--
SELECT
  DATE_FORMAT(MIN(created_at), "%M %D %Y") AS date 
FROM users;

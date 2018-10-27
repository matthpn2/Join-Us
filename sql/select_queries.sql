-- FIND EARLIEST DATE A USER JOINED --
SELECT DATE_FORMAT(created_at, '%M %D %Y') AS earliest_date 
FROM users ORDER BY created_at 
LIMIT 1;

SELECT DATE_FORMAT(MIN(created_at), '%M %D %Y') AS earliest_date
FROM users;

-- FIND EMAIL OF THE FIRST EARLIEST USER --
SELECT email
FROM users
ORDER BY created_at
LIMIT 1;

SELECT email
FROM users
WHERE created_at = (SELECT MIN(created_at) FROM users);

-- FIND USERS ACCORDING TO THE MONTH THEY JOINED --
SELECT 
    MONTHNAME(created_at) AS month,
    COUNT(*) AS count
FROM users
GROUP BY month
ORDER BY count DESC;

-- COUNT NUMBER OF USERS WITH YAHOO EMAILS --
SELECT COUNT(*) AS yahoo_users
FROM users
WHERE email LIKE "%@yahoo.com";

-- CALCULATE TOTAL NUMBER OF USERS FOR EACH EMAIL HOST --
SELECT
    CASE
        WHEN email LIKE "%@gmail.com" THEN 'gmail'
        WHEN email LIKE "%@yahoo.com" THEN 'yahoo'
        WHEN email LIKE "%@hotmail.com" THEN 'hotmail'
        ELSE 'other'
    END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;
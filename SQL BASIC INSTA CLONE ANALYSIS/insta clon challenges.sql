  /*Find the 5 new users.*/
SELECT * FROM users
ORDER BY created_at DESC
LIMIT 5;
/*Find the 5 oldest users*/
SELECT * FROM users
ORDER BY created_at 
LIMIT 5;

/*What day of the week do most users register on?*/

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

/*We want to target our inactive users with an email campaign.
Find the users who have never posted a photo*/
SELECT username
FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;

/*How many times does the average user post?
total number of photos/total number of users*/
SELECT ROUND((SELECT COUNT(*)FROM photos)/(SELECT COUNT(*) FROM users),2);

/*What are the top 5 most commonly used hashtags?*/
SELECT tag_name, COUNT(tag_name) AS total
FROM tags
JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total DESC;

/*Find users who have liked every single photo on the site*/
SELECT users.id,username, COUNT(users.id) As total_likes_by_user
FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY users.id
HAVING total_likes_by_user = (SELECT COUNT(*) FROM photos);

/*total numbers of users who have posted at least one time */
SELECT COUNT(DISTINCT(users.id)) AS total_number_of_users_with_posts
FROM users
JOIN photos ON users.id = photos.user_id;








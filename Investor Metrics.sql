/*B) Investor Metrics:

User Engagement: Investors want to know if users are still active and posting on Instagram or if they are making fewer posts.
Your Task: Calculate the average number of posts per user on Instagram. Also, provide the total number of photos on Instagram divided by the total number of users.
Bots & Fake Accounts: Investors want to know if the platform is crowded with fake and dummy accounts.
Your Task: Identify users (potential bots) who have liked every single photo on the site, as this is not typically possible for a normal user.*/

/*User Engagement: Investors want to know if users are still active and posting on Instagram or if they are making fewer posts.
Your Task: Calculate the average number of posts per user on Instagram. Also, provide the total number of photos on Instagram divided by the total number of users.*/


/*The total number of photos on Instagram divided by the total number of users.*/
SELECT ROUND((SELECT COUNT(*)FROM photos)/(SELECT COUNT(*) FROM users));

/*Calculate the average number of posts per user on Instagram.*/
SELECT * FROM photos;
SELECT user_id, count(*) AS post_numbers FROM photos
GROUP BY user_id
ORDER BY post_numbers DESC;
SELECT AVG(post_numbers) as avg_post_numbers
FROM ( SELECT user_id, count(*) AS post_numbers FROM photos
GROUP BY user_id
ORDER BY post_numbers DESC) AS users_post;


/*Bots & Fake Accounts: Investors want to know if the platform is crowded with fake and dummy accounts.
Your Task: Identify users (potential bots) who have liked every single photo on the site, as this is not typically possible for a normal user.*/
SELECT * FROM users;
SELECT * FROM likes;
SELECT * FROM photos;
SELECT COUNT(*) FROM photos AS total_likes;
SELECT users.id, users.username, COUNT(users.id) As total_likes
FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY users.id
HAVING total_likes = (SELECT COUNT(*) FROM photos);
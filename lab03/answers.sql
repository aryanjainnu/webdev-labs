-- Exercise 1 (done for you):
SELECT * FROM users;


-- Exercise 2 (done for you):
SELECT id, first_name, last_name 
FROM users;



-- Exercise 3
SELECT id, first_name, last_name 
FROM users
ORDER BY last_name ASC;



-- Exercise 4
SELECT id, user_id, image_url 
FROM posts 
WHERE user_id = (
SELECT id 
FROM users
WHERE (first_name ='Cody'
AND last_name = 'Young'))

-- Exercise 5
SELECT id, user_id, image_url 
FROM posts 
WHERE user_id IN (
SELECT id 
FROM users
WHERE ((first_name ='Cody'AND last_name = 'Young') 
	OR (first_name='David' AND last_name = 'Barrett'))
	)



-- Exercise 6
SELECT count(*) FROM posts;



-- Exercise 7
SELECT user_id, Count(*) as num_comm
FROM comments 
GROUP BY user_id
ORDER BY num_comm DESC;



-- Exercise 8
SELECT posts.id, posts.image_url, posts.user_id, 
	users.username, users.first_name, users.last_name
FROM (posts JOIN users ON posts.user_id = users.id)
WHERE posts.user_id IN (
SELECT id 
FROM users
WHERE ((first_name ='Cody'AND last_name = 'Young') 
	OR (first_name='David' AND last_name = 'Barrett'))
	);



-- Exercise 9
SELECT posts.id, posts.pub_date, following.following_id
FROM (posts JOIN following on posts.user_id=following.following_id)
WHERE following.user_id = (
SELECT id 
FROM users
WHERE (first_name ='Cody'
AND last_name = 'Young'))



-- Exercise 10
SELECT posts.id, posts.pub_date, following.following_id, users.username
FROM ((posts JOIN following on posts.user_id=following.following_id) 
	  JOIN users on following.following_id = users.id)
WHERE following.user_id = (
SELECT id 
FROM users
WHERE (first_name ='Cody'
AND last_name = 'Young'))
ORDER BY posts.pub_date DESC;



-- Exercise 11
INSERT into bookmarks(user_id, post_id)
VALUES (26, 219),
(26, 220),
(26, 221);


-- Exercise 12
DELETE FROM bookmarks 
WHERE (
(user_id=26 and post_id=219) OR 
(user_id=26 and post_id=220) OR 
(user_id=26 and post_id=221)
);

-- Exercise 13
UPDATE users
SET email='cyoung2022@gmail.com'
WHERE first_name='Cody' AND last_name='Young';

-- Exercise 14
SELECT posts.id, posts.user_id, count(*) as num_comments, posts.caption
FROM (posts JOIN comments on posts.id=comments.post_id)
WHERE posts.user_id= (
SELECT id 
FROM users
WHERE (first_name ='Cody'
AND last_name = 'Young'))
GROUP BY posts.id
ORDER BY num_comments DESC;
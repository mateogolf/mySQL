SELECT users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users as user2 ON user2.id = friendships.friend_id
GROUP BY users.id;
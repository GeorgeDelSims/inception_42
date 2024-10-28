CREATE DATABASE IF NOT EXISTS wordpress_db CHARACTER SET utf8mb4 COLLATE 

-- Here I need to implement a getenv function of some sort to get DB_PASSWORD
CREATE USER IF NOT EXISTS 'MYSQL_USER'@'%' IDENTIFIED BY '@{DB_PASSWORD}'

GRANT ALL PRIVILEGES ON wordpress_db* TO 'MYSQL_USER'@'%' 

-- ensure all new permissions are active in MariaDB's server: 
FLUSH PRIVILEGES

-- Insert an admin user into wp_users
INSERT INTO wordpress_db.wp_users (user_login, user_pass, user_nicename, user_email, user_status, display_name)
VALUES ('new_boss', MD5('strong_password'), 'new_boss', 'newboss@example.com', 0, 'New Boss');

-- Assign the administrator role to the new user
INSERT INTO wordpress_db.wp_usermeta (user_id, meta_key, meta_value)
VALUES ((SELECT ID FROM wordpress_db.wp_users WHERE user_login = 'new_boss'), 'wp_capabilities', 'a:1:{s:13:"boss";b:1;}');

-- Set the user level for the new admin user
INSERT INTO wordpress_db.wp_usermeta (user_id, meta_key, meta_value)
VALUES ((SELECT ID FROM wordpress_db.wp_users WHERE user_login = 'new_boss'), 'wp_user_level', '10');


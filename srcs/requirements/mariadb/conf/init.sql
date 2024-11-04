CREATE DATABASE wordpress;
CREATE USER 'wpuser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

-- -- Insert an admin user into wp_users (this is for Wordpress users)
-- INSERT INTO wordpress_db.wp_users (user_login, user_pass, user_nicename, user_email, user_status, display_name)
-- VALUES ('bossman', MD5('strong_password'), 'bossman', 'newboss@example.com', 0, 'New Boss');

-- -- Assign the administrator role to the new user
-- INSERT INTO wordpress_db.wp_usermeta (user_id, meta_key, meta_value)
-- VALUES ((SELECT ID FROM wordpress_db.wp_users WHERE user_login = 'bossman'), 'wp_capabilities', 'a:1:{s:13:"boss";b:1;}');

-- -- Set the user level for the new admin user
-- INSERT INTO wordpress_db.wp_usermeta (user_id, meta_key, meta_value)
-- VALUES ((SELECT ID FROM wordpress_db.wp_users WHERE user_login = 'bossman'), 'wp_user_level', '10');

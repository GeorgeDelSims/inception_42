<?php
// Database settings
define('DB_NAME', getenv('MYSQL_DATABASE') ?: 'wordpress');
define('DB_USER', getenv('WP_USER'));
define('DB_PASSWORD', getenv('WP_USER_PASSWORD'));
define('DB_HOST', getenv('WORDPRESS_DB_HOST') ?: 'mariadb');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// Security Keys and Salts 
define('AUTH_KEY',         'generate unique key');
define('SECURE_AUTH_KEY',  'generate unique key');
define('LOGGED_IN_KEY',    'generate unique key');
define('NONCE_KEY',        'generate unique key');
define('AUTH_SALT',        'generate unique key');
define('SECURE_AUTH_SALT', 'generate unique key');
define('LOGGED_IN_SALT',   'generate unique key');
define('NONCE_SALT',       'generate unique key');

// Ensures WordPress can write to files
define('FS_METHOD', 'direct');

$table_prefix = 'thiswp_';

// Debugging Settings 
define('WP_DEBUG', false);

// Define these if WordPress is accessible at a custom domain or IP
define('WP_HOME', 'https://gsims.42.fr');
define('WP_SITEURL', 'https://gsims.42.fr');

// Absolute Path to the WordPress Directory
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

// Sets up WordPress Variables and Included Files 
require_once(ABSPATH . 'wp-settings.php');

<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', getenv('MYSQL_DATABASE'));

/** Database username */
define('DB_USER', getenv('MYSQL_USER'));

/** Database password */
define('DB_PASSWORD', getenv('MYSQL_PASSWORD'));

/** Database hostname */
define('DB_HOST', getenv('DB_HOST'));

/** Database charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The database collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

// define('WP_HOME', 'gsims.42.fr');

// define('WP_SITEURL', 'gsims.42.fr');

// define('WP_ALLOW_REPAIR', true);

define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', true);

error_log('DB_NAME: ' . DB_NAME, 0);
error_log('DB_USER: ' . DB_USER, 0);
error_log('DB_PASSWORD: ' . DB_PASSWORD, 0);
error_log('DB_HOST: ' . DB_HOST, 0);

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'generate unique key');
define('SECURE_AUTH_KEY',  'generate unique key');
define('LOGGED_IN_KEY',    'generate unique key');
define('NONCE_KEY',        'generate unique key');
define('AUTH_SALT',        'generate unique key');
define('SECURE_AUTH_SALT', 'generate unique key');
define('LOGGED_IN_SALT',   'generate unique key');
define('NONCE_SALT',       'generate unique key');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */

/* Add any custom values between this line and the "stop editing" line. */

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
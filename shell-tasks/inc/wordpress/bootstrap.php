<?php

/* ----------------------------------------------------------
  Load WordPress
---------------------------------------------------------- */

/* It could take a while */
set_time_limit(0);
ini_set('memory_limit', '1G');

/* Disable default environment */
define('WP_USE_THEMES', false);

/* Disable some scripts */
define('WP_ADMIN', 1);

/* Load WordPress */
/* Thanks to http://boiteaweb.fr/wordpress-bootstraps-ou-comment-bien-charger-wordpress-6717.html */
chdir(dirname(__FILE__));
$bootstrap = 'wp-load.php';
while (!is_file($bootstrap)) {
    if (is_dir('..') && getcwd() != '/') {
        chdir('..');
    } else {
        die('EN: Could not find WordPress! FR : Impossible de trouver WordPress !');
    }
}

include $bootstrap;

/* Start WP */
wp();

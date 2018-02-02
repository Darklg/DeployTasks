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

/* ----------------------------------------------------------
  Flush rules
---------------------------------------------------------- */

flush_rewrite_rules();
echo "- Rewrite rules flushed.\n";

/* ----------------------------------------------------------
  Empty Object cache
---------------------------------------------------------- */

wp_cache_flush();
echo "- Object Cache flushed.\n";

/* ----------------------------------------------------------
  Empty W3TC
---------------------------------------------------------- */

if (function_exists('w3tc_flush_all')) {
    w3tc_flush_all();
    echo "- W3TC Cache flushed.\n";
}

/* ----------------------------------------------------------
  Empty & reload WP Rocket
---------------------------------------------------------- */

// Clear cache.
if (function_exists('rocket_clean_domain')) {
    rocket_clean_domain();
    echo "- WP Rocket Cache flushed.\n";
}

// Preload cache.
if (function_exists('run_rocket_sitemap_preload')) {
    run_rocket_sitemap_preload();
    echo "- WP Rocket Cache preloaded.\n";
}

/* ----------------------------------------------------------
  Reload home cache
---------------------------------------------------------- */

wp_remote_get(get_site_url());
echo "- Object cache reloaded on homepage.\n";

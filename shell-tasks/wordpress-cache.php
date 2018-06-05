<?php

include dirname( __FILE__ ) . '/inc/wordpress/bootstrap.php';

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

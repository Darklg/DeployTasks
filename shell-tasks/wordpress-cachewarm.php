<?php

include dirname(__FILE__) . '/inc/wordpress/bootstrap.php';

/* ----------------------------------------------------------
  Reload home cache
---------------------------------------------------------- */

wp_remote_get(get_site_url());
echo "- Object cache reloaded on homepage.\n";

/* ----------------------------------------------------------
  Reload page cache
---------------------------------------------------------- */

$wpq_cachewarmer = new WP_Query(array(
    'posts_per_page' => 99,
    'post_type' => 'page'
));
if ($wpq_cachewarmer->have_posts()) {
    while ($wpq_cachewarmer->have_posts()) {
        $wpq_cachewarmer->the_post();
        echo "- Object cache reloaded on page '" . esc_html(get_the_title()) . "'.\n";
        wp_remote_get(get_permalink());
        wp_ob_end_flush_all();
        flush();
    }
}
wp_reset_postdata();

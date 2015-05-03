<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 */
?>

  </div><!-- #main-content -->

  <footer id="colophon" class="site-footer" role="contentinfo">
    <div class="site-info">
      <a href="<?php echo esc_url( __( 'http://wordpress.org/', '_s' ) ); ?>"><?php printf( __( 'Proudly powered by %s', '_s' ), 'WordPress' ); ?></a>
    </div><!-- .site-info -->
  </footer><!-- #colophon -->
</div><!-- #page -->


<script src="<?=get_template_directory_uri()?>/assets/js/core-bundle.js"></script>
<?php wp_footer(); ?>

</body>
</html>
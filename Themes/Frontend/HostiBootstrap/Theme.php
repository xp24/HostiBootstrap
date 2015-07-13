<?php

namespace Shopware\Themes\HostiBootstrap;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme {
	protected $name = "Bootstrap für Shopware 5";
	protected $description = "";
	protected $author = "";
	protected $license = "";

	protected $javascript = array(
		// jQuery
		'vendors/js/jquery/jquery.min.js',

		// Bootstrap
        'vendors/js/bootstrap/affix.js',
        'vendors/js/bootstrap/scrollspy.js',

		// MatchHeight
		'vendors/js/matchHeight/jquery.matchHeight-min.js',

		// Custom Js
		'src/js/jquery.class.js',
		'src/js/jquery.base.js',
		'src/js/jquery.util.js',
		'src/js/jquery.auto-height.js',
        'src/js/search.js',

        // Shopware Plugins
        // Shopware specific plugins
        'src/js/shopware/jquery.ie-fixes.js',
        'src/js/shopware/jquery.plugin-base.js',
        'src/js/shopware/jquery.state-manager.js',
        'src/js/shopware/jquery.storage-manager.js',
        'src/js/shopware/jquery.off-canvas-menu.js',
        'src/js/shopware/jquery.search.js',
        'src/js/shopware/jquery.tab-menu.js',
        'src/js/shopware/jquery.image-slider.js',
        'src/js/shopware/jquery.image-zoom.js',
        'src/js/shopware/jquery.collapse-panel.js',
        'src/js/shopware/jquery.auto-submit.js',
        'src/js/shopware/jquery.scroll.js',
        'src/js/shopware/jquery.product-slider.js',
        'src/js/shopware/jquery.register.js',
        'src/js/shopware/jquery.modal.js',
        'src/js/shopware/jquery.selectbox-replacement.js',
        'src/js/shopware/jquery.captcha.js',
        'src/js/shopware/jquery.drop-down-menu.js',
        'src/js/shopware/jquery.loading-indicator.js',
        'src/js/shopware/jquery.overlay.js',
        'src/js/shopware/jquery.form-polyfill.js',
        'src/js/shopware/jquery.pseudo-text.js',
        'src/js/shopware/jquery.last-seen-products.js',
        'src/js/shopware/jquery.lightbox.js',
        'src/js/shopware/jquery.ajax-product-navigation.js',
        'src/js/shopware/jquery.newsletter.js',
        'src/js/shopware/jquery.menu-scroller.js',
        'src/js/shopware/jquery.shipping-payment.js',
        'src/js/shopware/jquery.add-article.js',
        'src/js/shopware/jquery.range-slider.js',
        'src/js/shopware/jquery.filter-component.js',
        'src/js/shopware/jquery.listing-actions.js',
        'src/js/shopware/jquery.collapse-cart.js',
        'src/js/shopware/jquery.emotion.js',
        'src/js/shopware/jquery.product-compare-add.js',
        'src/js/shopware/jquery.product-compare-menu.js',
        'src/js/shopware/jquery.infinite-scrolling.js',
        'src/js/shopware/jquery.off-canvas-button.js',
        'src/js/shopware/jquery.subcategory-nav.js',
        'src/js/shopware/jquery.ajax-wishlist.js',
        'src/js/shopware/jquery.preloader-button.js',
        'src/js/shopware/jquery.image-gallery.js',
        'src/js/shopware/jquery.offcanvas-html-panel.js',
        'src/js/shopware/jquery.jump-to-tab.js',
        'src/js/shopware/jquery.shopware-responsive.js'
	);

	public function createConfig(Form\Container\TabContainer $container) {}
}
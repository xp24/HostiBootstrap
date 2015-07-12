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
		'vendors/js/bootstrap/tab.js',
		'vendors/js/bootstrap/modal.js',
        'vendors/js/bootstrap/affix.js',
        'vendors/js/bootstrap/dropdown.js',
        'vendors/js/bootstrap/modal.js',
        'vendors/js/bootstrap/button.js',
        'vendors/js/bootstrap/scrollspy.js',
        'vendors/js/bootstrap/transition.js',
        'vendors/js/bootstrap/tooltip.js',

		// MatchHeight
		'vendors/js/matchHeight/jquery.matchHeight-min.js',

		// Custom Js
		'src/js/jquery.class.js',
		'src/js/jquery.base.js',
		'src/js/jquery.util.js',
		'src/js/jquery.auto-height.js',
        'src/js/search.js'
	);

	public function createConfig(Form\Container\TabContainer $container) {}
}
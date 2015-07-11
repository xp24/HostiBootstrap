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
		'vendors/js/bootstrap/modal.js'
	);

	public function createConfig(Form\Container\TabContainer $container) {}
}
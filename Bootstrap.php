<?php
class Shopware_Plugins_Frontend_HostiBootstrap_Bootstrap extends Shopware_Components_Plugin_Bootstrap {
	private $pluginConfig = '{
  "label": "Hosti Bootstrap",
  "version": "1.0.0",
  "author": "Hostianer Media UG (haftungsbeschränkt)",
  "supplier": "Hostianer Media UG (haftungsbeschränkt)",
  "description": "Bootstrap für Shopware 5",
  "support": "Shopware Forum",
  "link": "https://blog.hostianer.de"
}';

	public function __construct($name, $info = null) {
		$this->pluginConfig = json_decode($this->pluginConfig, true);
		parent::__construct($name, $info);
	}

	public function getLabel() {
		return $this->pluginConfig['label'];
	}

	public function getVersion() {
		return $this->pluginConfig['version'];
	}

	public function getInfo() {
		return $this->pluginConfig;
	}
}

<?php

namespace Shopware\Themes\HostiBootstrap;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    protected $name = <<<'SHOPWARE_EOD'
Bootstrap für Shopware 5
SHOPWARE_EOD;

    protected $description = <<<'SHOPWARE_EOD'

SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'

SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'

SHOPWARE_EOD;

    public function createConfig(Form\Container\TabContainer $container)
    {
    }
}
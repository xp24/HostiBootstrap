<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{url controller='index'}" title="{"{config name=shopName}"|escape} - {"{s name='IndexLinkDefault' namespace="frontend/index/index"}{/s}"|escape}">{"{config name=shopName}"|escape}</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" itemscope="itemscope" itemtype="http://schema.org/SiteNavigationElement">
                {strip}

                    {block name='frontend_index_navigation_categories_top_before'}{/block}

                    {foreach $sMainCategories as $sCategory}
                        {block name='frontend_index_navigation_categories_top_entry'}
                            {if !$sCategory.hidetop}
                                <li class="{if $sCategory.flag}active{/if}">
                                    <a href="{$sCategory.link}" title="{$sCategory.description}" itemprop="url">
                                        <span itemprop="name">{$sCategory.description}</span>
                                    </a>
                                </li>
                            {/if}
                        {/block}
                    {/foreach}

                    {block name='frontend_index_navigation_categories_top_after'}{/block}

                {/strip}
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

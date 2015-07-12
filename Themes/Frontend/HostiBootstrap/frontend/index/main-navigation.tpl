<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse p-l-0" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" itemscope="itemscope" itemtype="http://schema.org/SiteNavigationElement">
                {strip}

                    {block name='frontend_index_navigation_categories_top_before'}
                        <li>
                            <a href="{url controller='index'}" title="{"{config name=shopName}"|escape} - {"{s name='IndexLinkDefault' namespace="frontend/index/index"}{/s}"|escape}">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                    {/block}

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

            <ul class="nav navbar-nav navbar-right m-r-0">
                <li><a href="">Mein Konto</a> </li>
            </ul>

            <form class="navbar-form" role="search">
                <div class="input-group" style="width: 100%;">
                    <input type="text" class="form-control" placeholder="Suche ...">
						<span class="input-group-btn" style="width: 1%;">
							<button type="reset" class="btn btn-default">
								<span class="fa fa-times">
									<span class="sr-only">Schließen</span>
								</span>
                            </button>
							<button type="submit" class="btn btn-default">
								<span class="fa fa-search">
									<span class="sr-only">Suche</span>
								</span>
                            </button>
						</span>
                </div>
            </form>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

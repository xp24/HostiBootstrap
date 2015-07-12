<ol class="breadcrumb" role="menu">

    {* Prefix for the breadcrumb e.g. the configured shop name *}
    {block name="frontend_index_breadcrumb_prefix"}{/block}

    {block name="frontend_index_breadcrumb_content"}
        {foreach $sBreadcrumb as $breadcrumb}
            {block name="frontend_index_breadcrumb_entry"}
                <li {if $breadcrumb@last}class="active"{/if} role="menuitem" itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                    {if $breadcrumb.name}
                        {block name="frontend_index_breadcrumb_entry_inner"}
                            {if $breadcrumb@last}
                                <span itemprop="title">{$breadcrumb.name}</span>
                            {else}
                            <a title="{$breadcrumb.name|escape}" itemprop="url">
                                <span itemprop="title">{$breadcrumb.name}</span>
                            </a>
                            {/if}
                        {/block}
                    {/if}
                </li>
            {/block}
        {/foreach}
    {/block}

    {block name="frontend_index_breadcrumb_suffix"}{/block}
</ol>
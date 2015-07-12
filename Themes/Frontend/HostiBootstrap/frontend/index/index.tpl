{block name="frontend_index_start"}{/block}
{block name="frontend_index_doctype"}
<!DOCTYPE html>
{/block}
{block name='frontend_index_html'}
<html class="no-js" lang="{s name='IndexXmlLang'}{/s}" itemscope="itemscope" itemtype="http://schema.org/WebPage">
{/block}

{block name='frontend_index_header'}
    {include file='frontend/index/header.tpl'}
{/block}
<body class="is--ctl-{controllerName} is--act-{controllerAction}{if $sUserLoggedIn} is--user{/if}{if $sTarget} is--target-{$sTarget}{/if}">
{block name="frontend_index_no_script_message"}
    <noscript>
        <div class="alert alert-error">{s name="IndexNoscriptNotice"}{/s}</div>
    </noscript>
{/block}

{block name='frontend_index_before_page'}{/block}

{block name='frontend_index_navigation'}
    {block name='frontend_index_top_bar_container'}{/block}
    {block name='frontend_index_logo_container'}
        <header class="container">
            {block name='frontend_index_logo_container'}
                {include file="frontend/index/logo-container.tpl"}
            {/block}
        </header>
    {/block}

    {block name='frontend_index_shop_navigation'}
        {include file="frontend/index/main-navigation.tpl"}
    {/block}

    {block name='frontend_index_navigation_categories_top'}
        {block name="frontend_index_navigation_categories_top_include"}{/block}
    {/block}
{/block}

{block name='frontend_index_emotion_loading_overlay'}{/block}

<section class="container">
    {block name='frontend_index_breadcrumb'}
        {if count($sBreadcrumb)}
            {block name='frontend_index_breadcrumb_inner'}
                {include file='frontend/index/breadcrumb.tpl'}
            {/block}
        {/if}
    {/block}

    {block name="frontend_index_content_top"}{/block}
    {block name='frontend_index_content_left'}
    {/block}

    {block name='frontend_index_content_wrapper'}
        {block name='frontend_index_content'}

        {/block}
    {/block}

    {block name='frontend_index_content_right'}{/block}
    {block name='frontend_index_left_last_articles'}
    {/block}
</section>

{block name="frontend_index_footer"}
    {block name="frontend_index_footer_container"}
    {/block}
{/block}
{block name='frontend_index_body_inline'}{/block}

{block name="frontend_index_header_javascript_jquery_lib"}
    {compileJavascript timestamp={themeTimestamp} output="javascriptFiles"}
    {foreach $javascriptFiles as $file}
        <script src="{$file}"></script>
    {/foreach}
{/block}

{block name="frontend_index_header_javascript"}
    {block name="frontend_index_header_javascript_inline"}{/block}
    {block name="frontend_index_header_javascript_jquery"}{/block}
{/block}
</body>
</html>

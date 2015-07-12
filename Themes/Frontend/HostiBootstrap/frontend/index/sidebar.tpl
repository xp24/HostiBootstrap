<aside class="col-md-3">

    {* if sCategoryContent is not available use sArticle.categoryID *}
    {if isset($sCategoryContent) && $sCategoryContent.id}
        {$subCategoryId = $sCategoryContent.id}
    {elseif isset($sArticle) && $sArticle.categoryID}
        {$subCategoryId = $sArticle.categoryID}
    {elseif isset($sCustomPage) && $sCustomPage.id}
        {$subCategoryId = $sCustomPage.id}
    {else}
        {$subCategoryId = 0}
    {/if}

    <div class="sidebar--categories-wrapper"
         data-subcategory-nav="true"
         data-mainCategoryId="{$sCategoryStart}"
         data-categoryId="{$subCategoryId}"
         data-fetchUrl="{if $subCategoryId}{if $sCustomPage}{url module=widgets controller=listing action=getCustomPage pageId={$subCategoryId}}{else}{url module=widgets controller=listing action=getCategory categoryId={$subCategoryId}}{/if}{/if}">

        {* Sidebar category tree *}
        {block name='frontend_index_left_categories'}

            {* Categories headline *}
            {block name="frontend_index_left_categories_headline"}
               <h4>{s namespace='frontend/index/menu_left' name="IndexSidebarCategoryHeadline"}{/s}</h4>
            {/block}

            {* Actual include of the categories *}
            {block name='frontend_index_left_categories_inner'}
                <div class="list-group">
                    {include file='frontend/index/sidebar-categories.tpl'}
                </div>
            {/block}
        {/block}
</aside>
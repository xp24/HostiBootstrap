{* Emotion worlds *}
{block name="frontend_listing_list_promotion"}
    {if $hasEmotion}
        {$showListing = false}
        {$fullscreen = false}

        {block name="frontend_listing_emotions"}
            <div class="content--emotions">

                {foreach $emotions as $emotion}

                    {if $hasEscapedFragment}
                        {if 0|in_array:$emotion.devicesArray}
                            {if $emotion.showListing == 1}
                                {$showListing = true}
                            {/if}

                            {if $emotion.fullscreen == 1}
                                {$fullscreen = true}
                            {/if}

                            <div class="emotion--fragment">
                                {action module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller}
                            </div>
                        {/if}
                    {else}
                        {if $emotion.showListing == 1}
                            {$showListing = true}
                        {/if}

                        {if $emotion.fullscreen == 1}
                            {$fullscreen = true}
                        {/if}

                        <div class="emotion--wrapper"
                             data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller}"
                             data-availableDevices="{$emotion.devices}"
                             data-showListing="{if $emotion.showListing == 1}true{else}false{/if}">
                        </div>
                    {/if}
                {/foreach}

                {block name="frontend_listing_list_promotion_link_show_listing"}
                    <div class="emotion--show-listing{if $fullscreen} is--align-center{/if}">
                        <a href="{url controller='cat' sPage=1 sCategory=$sCategoryContent.id}" title="{$sCategoryContent.name|escape}" class="link--show-listing{if $fullscreen} btn is--primary{/if}" rel="nofollow">
                            {s name="ListingActionsOffersLink"}Weitere Artikel in dieser Kategorie &raquo;{/s}
                        </a>
                    </div>
                {/block}
            </div>
        {/block}
    {/if}
{/block}

{* Listing wrapper *}
{block name="frontend_listing_listing_wrapper"}
    {* Sorting and changing layout *}
    {block name="frontend_listing_top_actions"}

    {/block}

    {block name="frontend_listing_listing_container"}
        {block name="frontend_listing_listing_content"}

            <div class="listing"
            data-ajax-wishlist="true"
            data-compare-ajax="true"
            data-infinite-scrolling="true"
            data-loadPreviousSnippet="{s name="ListingActionsLoadPrevious"}{/s}"
            data-loadMoreSnippet="{s name="ListingActionsLoadMore"}{/s}"
            data-categoryId="{$sCategoryContent.id}"
            data-pages="{$pages}"
            data-threshold="{$theme.infiniteThreshold}">


            {* Actual listing *}
            {block name="frontend_listing_list_inline"}
                {foreach $sArticles as $sArticle}
                    {include file="frontend/listing/box_article.tpl"}
                {/foreach}
            {/block}

            </div>

        {/block}
    {/block}

    {* Paging *}
    {block name="frontend_listing_bottom_paging"}
        <div class="listing--bottom-paging">
            {include file="frontend/listing/actions/action-pagination.tpl"}
        </div>
    {/block}
{/block}
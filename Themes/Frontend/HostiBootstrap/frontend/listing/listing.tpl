{* Listing wrapper *}
{block name="frontend_listing_listing_wrapper"}
        {* Sorting and changing layout *}
        {block name="frontend_listing_top_actions"}

        {/block}

        {block name="frontend_listing_listing_container"}
                {block name="frontend_listing_listing_content"}
                        {* Actual listing *}
                        {block name="frontend_listing_list_inline"}
                                {foreach $sArticles as $sArticle}
                                    {include file="frontend/listing/box_article.tpl"}
                                {/foreach}
                        {/block}
                {/block}
        {/block}

        {* Paging *}
        {block name="frontend_listing_bottom_paging"}
            <div class="listing--bottom-paging">
                {include file="frontend/listing/actions/action-pagination.tpl"}
            </div>
        {/block}
{/block}
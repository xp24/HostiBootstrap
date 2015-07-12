{namespace name="frontend/listing/box_article"}

{* Small product badges on the left *}
{block name="frontend_listing_box_article_badges"}

        {* Discount badge *}
        {block name='frontend_listing_box_article_discount'}
            {if $sArticle.pseudoprice|number > $sArticle.price|number}
                <span class="label label-danger">
                   <i class="fa fa-tag"></i>
                </span>
            {/if}
        {/block}

        {* Highlight badge *}
        {block name='frontend_listing_box_article_hint'}
            {if $sArticle.highlight}
               <span class="label label-success">
                    {s name="ListingBoxTip"}{/s}
                </span>
            {/if}
        {/block}

        {* Newcomer badge *}
        {block name='frontend_listing_box_article_new'}
            {if $sArticle.newArticle}
                <span class="label label-primary">
                    {s name="ListingBoxNew"}{/s}
                </span>
            {/if}
        {/block}

        {* ESD product badge *}
        {block name='frontend_listing_box_article_esd'}
            {if $sArticle.esd}
                <span class="label label-warning">
                    <i class="fa fa-download"></i>
                </span>
            {/if}
        {/block}

{/block}






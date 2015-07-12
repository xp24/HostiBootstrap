{namespace name="frontend/listing/box_article"}

{* Default price *}
{block name='frontend_listing_box_article_price_default'}
    <p class="lead">
        <strong>
            <span class="{if $sArticle.pseudoprice|number > $sArticle.price|number} discount{/if}">
        {if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}{s name='ListingBoxArticleStartsAt'}{/s} {/if}
                {$sArticle.price|currency}
                {s name="Star"}{/s}
    </span>
        </strong>
    </p>
{/block}

{* Discount price *}
{block name='frontend_listing_box_article_price_discount'}
    {if $sArticle.pseudoprice|number > $sArticle.price|number}
        <span>
            {$sArticle.pseudoprice|currency}
            {s name="Star"}{/s}
        </span>
    {/if}
{/block}
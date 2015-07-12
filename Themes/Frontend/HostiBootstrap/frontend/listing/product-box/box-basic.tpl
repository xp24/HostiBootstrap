{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article"}
    <div class="col-sm-6 col-md-3">
    <div class="thumbnail {$productBoxLayout}">

        {block name="frontend_listing_box_article_content"}
            <div class="box--content is--rounded">

                {* Product box badges - highlight, newcomer, ESD product and discount *}
                {block name='frontend_listing_box_article_badges'}
                    {include file="frontend/listing/product-box/product-badges.tpl"}
                {/block}

                {block name='frontend_listing_box_article_info_container'}

                    {* Product image *}
                    {block name='frontend_listing_box_article_picture'}
                        {include file="frontend/listing/product-box/product-image.tpl"}
                    {/block}

                    <div class="caption">

                        {* Customer rating for the product *}
                        {block name='frontend_listing_box_article_rating'}
                            <div class="product--rating-container">
                                {if $sArticle.sVoteAverage.average}
                                    {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" label=false microData=false}
                                {/if}
                            </div>
                        {/block}

                        {* Product name *}
                        {block name='frontend_listing_box_article_name'}
                            <h3>
                                <a href="{$sArticle.linkDetails|rewrite:$sArticle.articleName}"
                                   class="product--title"
                                   title="{$sArticle.articleName|escape}">
                                    {$sArticle.articleName|truncate:50}
                                </a>
                            </h3>
                        {/block}

                        {* Product description *}
                        {block name='frontend_listing_box_article_description'}
                            <p>
                                {$sArticle.description_long|strip_tags|truncate:240}
                            </p>
                        {/block}

                        {block name='frontend_listing_box_article_price_info'}
                                {* Product price - Unit price *}
                                {block name='frontend_listing_box_article_unit'}
                                    {include file="frontend/listing/product-box/product-price-unit.tpl"}
                                {/block}

                                {* Product price - Default and discount price *}
                                {block name='frontend_listing_box_article_price'}
                                    {include file="frontend/listing/product-box/product-price.tpl"}
                                {/block}
                        {/block}

                        {* Product actions - Compare product, more information, buy now *}
                        {block name='frontend_listing_box_article_actions'}
                            {include file="frontend/listing/product-box/product-actions.tpl"}
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
    </div>
    </div>
{/block}
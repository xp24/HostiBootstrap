{* Product image - uses the picture element for responsive retina images. *}
<a href="{$sArticle.linkDetails|rewrite:$sArticle.articleName}"
   title="{$sArticle.articleName|escape}"
   >
    {block name='frontend_listing_box_article_image_element'}
            {block name='frontend_listing_box_article_image_media'}
                    {if isset($sArticle.image.thumbnails)}
                        {block name='frontend_listing_box_article_image_picture_element'}
                            <img class="img-responsive"
                                 srcset="{$sArticle.image.thumbnails[0].sourceSet}"
                                 alt="{$sArticle.articleName|escape}"
                                 title="{$sArticle.articleName|escape|truncate:25:""}" />
                        {/block}
                    {else}
                        <img class="img-responsive"
                             src="{link file='frontend/_public/src/img/no-picture.jpg'}"
                             alt="{$sArticle.articleName|escape}"
                             title="{$sArticle.articleName|escape|truncate:25:""}" />
                    {/if}
            {/block}
    {/block}
</a>
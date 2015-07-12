{namespace name="frontend/listing/box_article"}

<div class="product--actions">

    {* Compare button *}
    {block name='frontend_listing_box_article_actions_compare'}
        {if {config name="compareShow"}}
            <a href="{url controller='compare' action='add_article' articleID=$sArticle.articleID}"
               title="{s name='ListingBoxLinkCompare'}{/s}"
               class="btn btn-primary btn-block"
               data-product-compare-add="true"
               rel="nofollow">
                <i class="fa fa-compress"></i> {s name='ListingBoxLinkCompare'}{/s}
            </a>
        {/if}
    {/block}

    {* Note button *}
    {block name='frontend_listing_box_article_actions_save'}
    <a href="{url controller='note' action='add' ordernumber=$sArticle.ordernumber}"
       title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
class="btn btn-danger btn-block"
data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber}"
data-text="{s name="DetailNotepadMarked"}{/s}"
rel="nofollow">
<i class="fa fa-heart"></i> <span class="action--text">{s name="DetailLinkNotepadShort" namespace="frontend/detail/actions"}{/s}</span>
</a>
{/block}





</div>
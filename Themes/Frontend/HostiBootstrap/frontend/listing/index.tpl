{extends file='frontend/index/index.tpl'}

{block name='frontend_index_content_left'}
    {include file='frontend/listing/sidebar.tpl'}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    <div class="col-md-9">
    {* Listing *}
    {block name="frontend_listing_index_listing"}
        <div class="row">
            {include file='frontend/listing/listing.tpl'}
        </div>
    {/block}
    </div>
{/block}
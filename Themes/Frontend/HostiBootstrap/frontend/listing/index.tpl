{extends file='frontend/index/index.tpl'}

{* Main content *}
{block name='frontend_index_content'}
    <div class="row">

        <div class="col-md-12">
            {* Listing *}
            {block name="frontend_listing_index_listing"}
                {include file='frontend/listing/listing.tpl'}
            {/block}
        </div>

    </div>
{/block}
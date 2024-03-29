{* Per page filter which will be included in the "listing/listing_actions.tpl" *}
{namespace name="frontend/listing/listing_actions"}

{if $criteria && $criteria->getLimit() && $pageSizes}
    <form class="action--per-page action--content block" method="get" data-action-form="true" action="">

        {* Necessary to reset the page to the first one *}
        <input type="hidden" name="{$shortParameters.sPage}" value="1">

        {* Per page label *}
        {block name='frontend_listing_actions_items_per_page_label'}
            <label for="{$shortParameters.sPerPage}" class="per-page--label action--label">{s name='ListingLabelItemsPerPage'}{/s}</label>
        {/block}

        {* Per page field *}
        {block name='frontend_listing_actions_items_per_page_field'}
            <select id="{$shortParameters.sPerPage}" name="{$shortParameters.sPerPage}" class="per-page--field action--field" data-auto-submit="true" data-class="per-page--select">
                {foreach $pageSizes as $perPage}
                    <option value="{$perPage}" {if $perPage == $criteria->getLimit()}selected="selected"{/if}>{$perPage}</option>
                {/foreach}
                {block name='frontend_listing_actions_per_page_values'}{/block}
            </select>
        {/block}
    </form>
{/if}
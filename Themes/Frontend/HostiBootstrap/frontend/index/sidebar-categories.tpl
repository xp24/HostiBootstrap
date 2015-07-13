{* Maincategories left *}
{function name=categories level=0}
{block name="frontend_index_categories_left_before"}{/block}

{foreach $categories as $category}

    {block name="frontend_index_categories_left_entry"}
            <a class="list-group-item {if $category.flag} active{/if}"
               href="{$category.link}"
               data-categoryId="{$category.id}"
               data-fetchUrl="{url module=widgets controller=listing action=getCategory categoryId={$category.id}}"
               title="{$category.description|escape}">
                {$category.description}

                {if $category.childrenCount}
                    <i class="fa fa-arrow-circle-o-down pull-right"></i>
                {/if}
            </a>
            {block name="frontend_index_categories_left_entry_subcategories"}
                {if $category.subcategories}
                    {call name=categories categories=$category.subcategories level=$level+1}
                {/if}
            {/block}
    {/block}
{/foreach}

{block name="frontend_index_categories_left_after"}{/block}
{/function}

{if $sCategories}
    {call name=categories categories=$sCategories}
{elseif $sMainCategories}
    {call name=categories categories=$sMainCategories}
{/if}
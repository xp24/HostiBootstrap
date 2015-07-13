{extends file='frontend/index/index.tpl'}

{block name="frontend_index_content_top"}{/block}

{* Google optimized crawling *}
{block name='frontend_index_header_meta_tags' append}
    {if $hasEmotion && !$hasEscapedFragment}
        <meta name="fragment" content="!">
    {/if}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    <div class="content content--home">

        {block name='frontend_home_index_banner'}

        {/block}

        {block name='frontend_home_index_text'}

        {/block}

        {* Promotion *}
        {block name='frontend_home_index_promotions'}
            {if $hasEmotion}
                <div class="content--emotions">
                    {foreach $emotions as $emotion}
                        {if $hasEscapedFragment}
                            {if 0|in_array:$emotion.devicesArray}
                                <div class="emotion--fragment">
                                    {action module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller}
                                </div>
                            {/if}
                        {else}
                            <div class="emotion--wrapper"
                                 data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller}"
                                 data-availableDevices="{$emotion.devices}">
                            </div>
                        {/if}
                    {/foreach}
                </div>
            {/if}
        {/block}

        {block name='frontend_home_index_blog'}

        {/block}

        {* Tagcloud *}
        {block name='frontend_home_index_tagcloud'}

        {/block}
    </div>
{/block}

{block name='frontend_index_left_last_articles'}{/block}
{block name="widget_emotion_component_youtube"}
    <div class="emotion--youtube">
        {if $Data && $Data.video_id}
            <iframe class="external--content content--youtube"
                    width="100%"
                    height="100%"
                    src="http://www.youtube.com/embed/{$Data.video_id}{if $Data.video_hd}?hd=1&vq=hd720{/if}"
                    frameborder="0"
                    allowfullscreen>
            </iframe>
        {/if}
    </div>
{/block}
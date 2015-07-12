var AutoHeight = Class.extend({
    defaults : {
        allowedControllers: ['listing','detail','search']
    },

    init: function(o) {
        var me = this;
        me.setOptions(o);

        me.initThumbnails();
    },

    initThumbnails: function() {
        var me = this;
        $('.thumbnail').matchHeight();
    }
});
;(function($) {
    'use strict';

    $.plugin('shippingPayment', {

        defaults: {

            formSelector: '#shippingPaymentForm',

            radioSelector: 'input.auto_submit[type=radio]',

            submitSelector: 'input[type=submit]'
        },

        /**
         * Plugin constructor.
         */
        init: function () {
            var me = this;

            me.applyDataAttributes();
            me.registerEvents();
        },

        /**
         * Registers all necessary event listener.
         */
        registerEvents: function () {
            var me = this;

            me.$el.on('change', me.opts.radioSelector, $.proxy(me.onInputChanged, me));
        },

        /**
         * Called on change event of the radio fields.
         */
        onInputChanged: function () {
            var me = this,
                form = me.$el.find(me.opts.formSelector),
                url = form.attr('action'),
                data = form.serialize() + '&isXHR=1';

            $.loadingIndicator.open();

            $.ajax({
                type: "POST",
                url: url,
                data: data,
                success: function(res) {
                    me.$el.empty().html(res);
                    me.$el.find('input[type="submit"][form], button[form]').formPolyfill();
                    $.loadingIndicator.close();
                    window.picturefill();
                }
            })
        },

        /**
         * Destroy method of the plugin.
         * Removes attached event listener.
         */
        destroy: function() {
            var me = this;

            me.$el.off('change', me.opts.radioSelector);

            me._destroy();
        }
    });
})(jQuery);

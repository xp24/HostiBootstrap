;jQuery(function ($) {
    'use strict';

    $.plugin('collapseCart', {

        defaults: {

            /**
             * URL that will be called when the plugin is fetching the cart.
             *
             * @type {String}
             */
            'ajaxCartURL': $.controller['ajax_cart'],

            /**
             * Selector for the trigger element.
             * The trigger is the element that attaches to the click/tap/hover events.
             *
             * @type {String}
             */
            'triggerElSelector': '.navigation--entry.entry--cart',

            /**
             * Selector for the elements item container.
             *
             * @type {String}
             */
            'itemContainerSelector': '.item--container',

            /**
             * Selector for the remove button of single items.
             *
             * @type {String}
             */
            'removeItemSelector': '.action--remove',

            /**
             * Selector for the offcanvas close button.
             *
             * @type {String}
             */
            'offcanvasCloseElSelector': '.close--off-canvas',

            /**
             * Class for the loading indicator icon.
             *
             * @type {String}
             */
            'loadingIconClass': 'icon--loading-indicator',

            /**
             * Class that will be used for the loading icon wrapper.
             *
             * @type {String}
             */
            'loadingIconWrapperClass': 'ajax--cart',

            /**
             * Class that will be applied to the main plugin element when the menu opens.
             *
             * @type {String}
             */
            'activeClass': 'is--shown',

            /**
             * Mode of displaying the cart.
             * Can either be "collapsible" or "offcanvas".
             *
             * @type {String} displayMode
             */
            'displayMode': 'collapsible'
        },

        /**
         * Initializes the plugin and create all needed elements.
         */
        init: function () {
            var me = this,
                opts;

            // Override options with data attributes.
            me.applyDataAttributes();

            opts = me.opts;

            /**
             * Element that the events get attached to.
             *
             * @private
             * @property _$triggerEl
             * @type {jQuery}
             */
            me._$triggerEl = $(opts.triggerElSelector);

            /**
             * Loading icon that will be used for loading when an AJAX request is send.
             *
             * @private
             * @property _$loadingIcon
             * @type {jQuery}
             */
            me._$loadingIcon = $('<i>', {
                'class': opts.loadingIconClass
            });

            /**
             * Flag whether or not the menu is opened.
             *
             * @private
             * @property _isOpened
             * @type {Boolean}
             */
            me._isOpened = false;

            // if the display mode is "offcanvas", call the offcanvas plugin.
            if (me.isDisplayMode('offcanvas')) {
                me._$triggerEl.offcanvasMenu({
                    'offCanvasSelector': me.$el,
                    'direction': 'fromRight'
                });
            }

            me.registerEvents();
        },

        /**
         * Registers all needed events specific to the display mode.
         *
         * @public
         * @method registerEvents
         */
        registerEvents: function () {
            var me = this;

            me.$el.on(me.getEventName('click'), me.opts.removeItemSelector, $.proxy(me.onRemoveButtonClick, me));
            me.$el.on(me.getEventName('click touchstart'), me.opts.offcanvasCloseElSelector, $.proxy(me.onCloseButtonClick, me));

            if (me.isDisplayMode('offcanvas')) {
                me._on(me._$triggerEl, 'click touchstart', $.proxy(me.onMouseEnter, me));

                $.subscribe('plugin/addArticle/onAddArticle', $.proxy(me.onArticleAdded, me));
                $.subscribe('plugin/addArticle/onBeforeAddArticle', $.proxy(me.onBeforeAddArticle, me));
            } else {
                me._on(me._$triggerEl, 'mouseenter touchstart', $.proxy(me.onMouseEnter, me));
                me._on(me._$triggerEl, 'mouseleave', $.proxy(me.onMouseLeave, me));
                me._on(me.$el, 'mouseleave', $.proxy(me.onMouseLeave, me));
            }
        },

        /**
         * Will be fired from the addArticle plugin before the add-AJAX request will be send.
         * Sets the loading indicator as the content and opens the menu.
         *
         * @event onBeforeAddArticle
         */
        onBeforeAddArticle: function () {
            var me = this;

            me.showLoadingIndicator();
            me.openMenu();
        },

        /**
         * Will be fired from the addArticle plugin before the add-AJAX request is finished.
         * Loads the cart via AJAX and appends it to the basket.
         *
         * @event onArticleAdded
         */
        onArticleAdded: function (event, plugin, response) {
            var me = this;

            if (me.isDisplayMode('collapsible')) {
                return;
            }

            me.$el
                .html(response)
                .find('.ajax--cart .alert')
                .removeClass('is--hidden');

            picturefill();
        },

        /**
         * Will be called when the pointer enters/clicks/taps the trigger element.
         *
         * @event onMouseEnter
         * @param {jQuery.Event} event
         */
        onMouseEnter: function (event) {
            var me = this;

            me.showLoadingIndicator();
            me.openMenu();

            if (me.isDisplayMode('offcanvas')) {
                event.preventDefault();

                me.loadCart();
                return;
            }

            me.buffer(function () {
                me.loadCart(function () {
                    $('body').one('touchstart', $.proxy(me.onMouseLeave, me));
                });
            }, 500);
        },

        /**
         * Will be called when the mouse leaves the trigger/plugin element.
         *
         * @event onMouseLeave
         * @param {jQuery.Event} event
         */
        onMouseLeave: function (event) {
            var me = this,
                target = event.toElement || event.relatedTarget || event.target;

            $.publish('plugin/collapseCart/onMouseLeave', me);

            if (me.isElementOrChild(me.$el[0], target) || me.isElementOrChild(me._$triggerEl[0], target)) {
                return;
            }

            me.closeMenu();
        },

        /**
         * Will be called when the off canvas close button was clicked/tapped
         *
         * @event onCloseButtonClick
         * @param {jQuery.Event} event
         */
        onCloseButtonClick: function (event) {
            event.preventDefault();

            $.publish('plugin/collapseCart/onCloseButton', this);

            this.closeMenu();
        },

        /**
         * Will be called when the remove item button was clicked.
         *
         * @event onRemoveButtonClick
         * @param {jQuery.Event} event
         */
        onRemoveButtonClick: function (event) {
            event.preventDefault();

            var me = this,
                $currentTarget = $(event.currentTarget),
                $parent = $currentTarget.parent(),
                url = $currentTarget.attr('href');

            $.publish('plugin/collapseCart/onRemoveArticle', [me, event]);
            $parent.html(me._$loadingIcon.clone());

            $.ajax({
                'url': url,
                'dataType': 'jsonp',
                'success': function(result) {

                    me.$el.html(result);

                    picturefill();

                    $.publish('plugin/collapseCart/afterRemoveArticle', [me, event]);
                }
            });
        },

        /**
         * Sets a timeout and saves its timeout id.
         * When an id already exists, clear the timeout that belongs to that id.
         *
         * @param func
         * @param bufferTime
         */
        buffer: function(func, bufferTime) {
            var me = this;

            if (me.bufferTimeout) {
                clearTimeout(me.bufferTimeout);
            }

            me.bufferTimeout = setTimeout(func, bufferTime);
        },

        /**
         * Returns whether or not the second element is the same as / a child of the first.
         *
         * @param {HTMLElement} firstEl
         * @param {HTMLElement} secondEl
         * @returns {Boolean}
         */
        isElementOrChild: function (firstEl, secondEl) {
            return firstEl === secondEl || $.contains(firstEl, secondEl);
        },

        /**
         * Returns whether or not the current display mode is the given one.
         *
         * @public
         * @method isDisplayMode
         * @param {String} mode
         * @returns {Boolean}
         */
        isDisplayMode: function (mode) {
            return this.opts.displayMode === mode;
        },

        /**
         * Overrides the elements content with the configured loading indicator.
         *
         * @public
         * @method showLoadingIndicator
         */
        showLoadingIndicator: function () {
            var me = this;

            me.$el.html($('<div>', {
                'class': me.opts.loadingIconWrapperClass,
                'html': me._$loadingIcon.clone()
            }));
        },

        /**
         * Opens the offcanvas/collapsible cart.
         * If the offcanvas plugin is active on the element, its openMenu function will also be called.
         *
         * @public
         * @method closeMenu
         */
        openMenu: function () {
            var me = this,
                plugin;

            me._isOpened = true;

            if (me.isDisplayMode('offcanvas') && (plugin = me._$triggerEl.data('plugin_offcanvasMenu'))) {
                plugin.openMenu();
            } else {
                me.$el.addClass(me.opts.activeClass);
            }

            $.publish('plugin/collapseCart/onMenuOpen', me);
        },

        /**
         * Loads the cart content via the configured URL
         * and sets the response as plugin elements content.
         *
         * @public
         * @method loadCart
         * @param {Function} callback
         */
        loadCart: function (callback) {
            var me = this,
                opts = me.opts,
                $el = me.$el;

            $.publish('plugin/collapseCart/onLoadCart', me);

            $.ajax({
                'url': opts.ajaxCartURL,
                'dataType': 'jsonp',
                'success': function (result) {
                    $el.html(result);
                    picturefill();

                    if (typeof callback === 'function') {
                        callback();
                    }

                    $.publish('plugin/collapseCart/afterLoadCart', me);
                }
            });
        },

        /**
         * Closes the offcanvas/collapsible cart.
         * If the offcanvas plugin is active on the element, its closeMenu function will also be called.
         *
         * @public
         * @method closeMenu
         */
        closeMenu: function () {
            var me = this,
                plugin;

            me._isOpened = false;

            if (me.isDisplayMode('offcanvas') && (plugin = me._$triggerEl.data('plugin_offcanvasMenu'))) {
                plugin.closeMenu();
            } else {
                me.$el.removeClass(me.opts.activeClass);
            }

            $.publish('plugin/collapseCart/onCloseMenu', me);
        },

        /**
         * Destroys the plugin and removes all attached events and delegations.
         *
         * @public
         * @method destroy
         */
        destroy: function () {
            var me = this;

            me.off(me.eventSuffix);

            me._destroy();
        }
    });
});

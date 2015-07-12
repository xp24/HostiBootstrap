var Util = Class.extend({
    defaults : {
    },

    init: function(o) {
        this.setOptions(o);
        this.parseOptions();
    },

    parseOptions: function() {
        var me = this;
        me.bodyClasses = $('body').attr('class');
        var bodySplit = this.bodyClasses.split(' ');

        bodySplit.forEach(function(elementClass) {
            if(elementClass.indexOf('is--ctl-') != -1) {
                me.currentController = elementClass.replace('is--ctl-', '');
            } else if(elementClass.indexOf('is--act-') != -1) {
                me.currentAction = elementClass.replace('is--act-', '');
            }
        });
    },

    isController: function(controller) {
        var me = this;
        if(typeof controller == 'string') {
            if(this.currentController == controller) {
                return true;
            } else {
                return false;
            }
        } else {
            var controllerFound = false;
            controller.forEach(function(singleController) {
                if(!controllerFound) {
                    console.log()
                    if(me.currentController == singleController) {
                        controllerFound = true;
                    }
                }
            });
            return controllerFound;
        }
    },
    isAction: function(action) {
        var me = this;
        if(typeof action == 'string') {
            if(this.currentAction == action) {
                return true;
            } else {
                return false;
            }
        } else {
            var actionFound = false;
            action.forEach(function(singleAction) {
                if(!actionFound) {
                    if(me.currentAction == singleAction) {
                        actionFound = true;
                    }
                }
            });
            return actionFound;
        }
    },
});
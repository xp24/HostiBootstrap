var UtilManager;
$(function() {
    UtilManager = new Util();
    if(UtilManager.isController(new Array('listing', 'detail', 'search', 'emotion'))) {
        var AutoHeightManager = new AutoHeight();
    }
})
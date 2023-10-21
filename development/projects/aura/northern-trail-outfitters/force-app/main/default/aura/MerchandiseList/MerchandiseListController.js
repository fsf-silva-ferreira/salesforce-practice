({
    doInit: function(component, event, helper) {
        var filterObject = {
            searchKey: '',
            category: ''
        };
        component.set("v.filterObject", filterObject);
        helper.loadMerchandise(component);
    },

    onPreviousPage: function(component, event, helper) {
		var page = component.get("v.page") || 1;
        page = page - 1;
        helper.loadMerchandise(component, page);
	},

	onNextPage: function(component, event, helper) {
		var page = component.get("v.page") || 1;
        page = page + 1;
        helper.loadMerchandise(component, page);
    },
    
    searchKeyChangeHandler : function(component, event, helper) {
        var filterObject = component.get("v.filterObject");
        filterObject.searchKey = event.getParam("value");
        helper.loadMerchandise(component);
	},

    categoryChangeHandler : function(component, event, helper) {
        var filterObject = component.get("v.filterObject");
        filterObject.category = event.getParam("value");
        helper.loadMerchandise(component);
    }

})
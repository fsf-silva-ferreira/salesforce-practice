/*
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.lightning.meta/lightning/ref_jsapi_action.htm
*/
({
    doInit : function(component) {
        var action = component.get("c.findAll");
        action.setCallback(this, function(response) {
            component.set("v.contacts", response.getReturnValue());
        });

        $A.enqueueAction(action);
    },

    searchKeyChange : function(component, event) {
        var searchKey = event.getParam("searchKey");
        var action = component.get("c.findByName");        

        action.setParams({"searchKey" : searchKey});
        action.setCallback(this, function(response) {
            component.set("v.contacts", response.getReturnValue());
        });

        $A.enqueueAction(action);   
    }
})
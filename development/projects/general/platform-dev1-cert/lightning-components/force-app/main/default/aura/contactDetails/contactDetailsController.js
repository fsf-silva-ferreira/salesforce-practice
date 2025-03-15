/*
 * Documentation:
 * https://developer.salesforce.com/docs/component-library/bundle/aura:locationChange/documentation
*/
({
    handleLocationChange : function(component, event) {
        var locationChange = event.getParams(""); //The # part of the contact URL has been modified
        var token = locationChange.token; //The new hash part of the url
        
        if(token !== undefined && token.indexOf('contact/') === 0) {
            var contactId = token.substr(token.indexOf('/')+1);
            var action = component.get("c.findById");

            action.setParams({"contactId" : contactId});
            action.setCallback(this, function(response){
                component.set("v.contact", response.getReturnValue());
            });
    
            $A.enqueueAction(action);
        }
    }
})
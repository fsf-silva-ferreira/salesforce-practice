

//* WARNING:
//* Use unique names for client-side and server-side actions in a component. 
//* A JavaScript function (client-side action) with the same name as a server-side action (Apex method) can lead to hard-to-debug issues.
({
    setOpportunityList : function(component) {               
        var action = component.get("c.getOpportunityRecords");     

        debugger //Break point when using browser web tool (F12)

        action.setCallback(this, function(response) {            
            var state = response.getState();

            debugger
            
            if(state === "SUCCESS") {
                component.set("v.opportunities",response.getReturnValue());
            }
        });

        $A.enqueueAction(action);
    }
})
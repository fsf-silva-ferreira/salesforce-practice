({
    echo : function(component) {
        var action = component.get("c.serverEcho");
        //* Server-side method needs a parameter
        action.setParams({firstName : component.get("v.firstName")});
        //* Handling server-side response
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS") {
                alert("From Server: " + response.getReturnValue());
            } else 
            if(state === "INCOMPLETE"){
                /* Do nothing in your app if state is INCOMPLETE*/
            } else 
            if(state === "ERROR"){
                var errors = response.getError();
                if(errors) {
                    console.log('Error: ' + errors);
                }
            }
        });

        $A.enqueueAction(action);
    }
})
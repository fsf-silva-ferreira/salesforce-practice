/*
    cmp -> The component to which the controller belongs.

    event -> The event that the action is handling.
    
    helper -> The component’s helper, which is optional. 
    A helper contains functions that can be reused by any JavaScript code in the component bundle.
*/
({
    handleClick : function(cmp, event) {
        var attributeValue = cmp.get("v.text");
        console.log("Old text: " + attributeValue);

        var target = event.getSource();
        cmp.set("v.text", target.get("v.label"));

        attributeValue = cmp.get("v.text");
        console.log("New text: " + attributeValue);
    }
})
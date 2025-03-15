({
    add : function(component, event, helper) {
        var addResult = component.get("v.number1") + component.get("v.number2");
        component.set("v.sum", addResult);
    }
})
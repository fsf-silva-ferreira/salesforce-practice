({
    getInput : function(component, event) {
        var fullName = component.find("name").get("v.value");
        var outName = component.find("nameOutput");

        outName.set("v.value",fullName + "**");
    }
})
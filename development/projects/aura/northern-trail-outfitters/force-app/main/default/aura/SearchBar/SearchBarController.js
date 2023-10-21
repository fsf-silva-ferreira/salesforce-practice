({
	keyupHandler : function(component, event) {
        var changeEvent = component.getEvent("onchange");
        changeEvent.setParams({
            "value": event.getSource().get("v.value")
        });
        changeEvent.fire();
	},

    clearHandler : function(component) {
		component.find("searchInput").getElement().value = "";
        var changeEvent = component.getEvent("onchange");
        changeEvent.setParams({
            "value": ""
        });
        changeEvent.fire();
	}

})
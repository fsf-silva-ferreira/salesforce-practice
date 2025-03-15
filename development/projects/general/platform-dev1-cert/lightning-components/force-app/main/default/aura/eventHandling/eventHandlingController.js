({
    handleClick : function(component, event) {
        var attributeValue = component.get("v.text");
        console.log('Current text: ' + attributeValue);
        console.log('Source of the event: ' + event.getSource);

        var target;
        if(event.getSource) {
            //Framework
            console.log('Framework');
            target = event.getSource();
            component.set("v.text",target.get("v.label"));
        } else {
            //Hybrid button
            console.log('Hybrid');
            target = event.target.value;
            component.set("v.text",event.target.value + "****");
        }
    }
})
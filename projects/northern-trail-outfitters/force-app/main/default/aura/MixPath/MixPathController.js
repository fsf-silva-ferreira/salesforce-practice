({
    subscribe: function (component, event) {
        var empApi = component.find("empApi");
        var channel = component.get("v.channel");
        var replayId = -2;
        empApi.subscribe(channel, replayId, $A.getCallback(function (message) {
            var mix = component.get("v.record");
            if (message && message.data && message.data.sobject) {
                var mixId = message.data.sobject.Id;
                var status = message.data.sobject.Status__c;
                if (mixId === mix.Id && status !== mix.Status__c) {
                    component.find("mixRecord").reloadRecord(true);
                }
            }
        }));     
    },

    onStepChange: function (component, event) {
        var mix = component.get("v.record");
        if (mix) {
            mix.Status__c = event.getParam("detail").value;
            component.find("mixRecord").saveRecord($A.getCallback(function (saveResult) {
                //
            }));
        }
    },
    onRecordUpdated: function (component, event) {
        var changeType = event.getParams().changeType;
        if (changeType === "CHANGED") {
            var service = component.find("mixRecord");
            service.reloadRecord();
        }
    }

})
({
    subscribe: function (component, event) {
        var empApi = component.find("empApi");
        var channel = component.get("v.channel");
        var replayId = -2;
        empApi.subscribe(channel, replayId, $A.getCallback(function (message) {
            try {
                var tweets = component.get("v.tweets");
                var tweet = message.data.payload;
                tweet.Sentiment_Predictions__c = JSON.parse(tweet.Sentiment_Predictions__c);
                tweet.Intent_Predictions__c = JSON.parse(tweet.Intent_Predictions__c);
                tweet.Vision_Predictions__c = JSON.parse(tweet.Vision_Predictions__c);
                tweets.push(message.data.payload);
                component.set("v.tweets", tweets);
            } catch (e) {
                console.log(e);
            }
        }));
    }

})
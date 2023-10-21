/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-15-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class WebPageHtmlCallout {
        
    public static ExampleCalloutMock mock;
    
    public static List<String> getCalloutResponseContents(String url) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');

        List<String> jsonBody; 
        HttpResponse res;

        if (Test.isRunningTest() && (mock!=null)) {
            res = mock.respond(req);
        } else {
            Http http = new Http();
            res = http.send(req);

            jsonBody = res.getBody().split('\n');
        }

        return jsonBody;
    }
}

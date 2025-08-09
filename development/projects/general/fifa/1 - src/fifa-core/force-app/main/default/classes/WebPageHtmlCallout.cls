/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-09-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * External link:
 * https://salesforce.stackexchange.com/questions/85048/catch-regex-too-complicated-when-splitting-a-string-in-salesforce
**/
public with sharing class WebPageHtmlCallout {
        
    public static ExampleCalloutMock mock;
    
    public static List<String> getCalloutResponseContents(String url) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');

        List<String> jsonBody = new List<String>(); 
        HttpResponse response;

        if (Test.isRunningTest() && (mock!=null)) {
            response = mock.respond(req);
        } else {
            Http http = new Http();
            response = http.send(req);

            Utility_RowIterator rowIterator = new Utility_RowIterator(response.getBody(),'\n');
            while(rowIterator.hasNext()) {
                jsonBody.add(rowIterator.next());                
            }
        }

        return jsonBody;
    }
}

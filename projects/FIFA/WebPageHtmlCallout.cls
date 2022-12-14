/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-14-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class WebPageHtmlCallout {
    
    public static String getCalloutResponseContents(String url) {
        Http h = new Http();
    
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');

        HttpResponse res = h.send(req);

        return res.getBody();
    }
}

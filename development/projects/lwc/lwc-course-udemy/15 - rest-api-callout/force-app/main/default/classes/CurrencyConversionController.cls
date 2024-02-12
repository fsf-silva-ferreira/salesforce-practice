/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-11-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CurrencyConversionController {
    
    @AuraEnabled
    public static Map<String, Object> retrieveCurencyConversionRates(String strEndpointUrl) {
        Map<String, Object> mapJsonData = new Map<String, Object>();
        String strResponse = null;

        if(String.isNotBlank(strEndpointUrl)) {
            HttpRequest httpRequest = new HttpRequest();
            httpRequest.setEndpoint(strEndpointUrl);
            httpRequest.setMethod('GET');
            httpRequest.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
            httpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());

            try {
                Http http = new Http();
                HttpResponse httpResponse  = http.send(httpRequest);
                if (httpResponse.getStatusCode() == 200) {
                    strResponse = httpResponse.getBody();
                } else {
                    throw new CalloutException(httpResponse.getBody());
                }
            } catch (Exception e) {
                throw e;
            }
        }

        if(String.isNotBlank(strResponse)) {
            mapJsonData = (Map<String,Object>) JSON.deserializeUntyped(strResponse);
            System.debug('mapJsonData = ' + mapJsonData);
        }

        return mapJsonData;
    }
}
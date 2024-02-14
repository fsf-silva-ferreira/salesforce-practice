/**
 * @description       : API call to get currency exchange rate.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-14-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * 
 * Search source:
 * In apex, how to replace the value in the string
 * https://salesforce.stackexchange.com/questions/276105/in-apex-how-to-replace-the-value-in-the-string
**/
public with sharing class CurrencyConversionController {

    @AuraEnabled
    public static Map<String, Object> retrieveCurencyConversionRates(String fromCurrencyValue, String toCurrencyValue) {
        String currencyExchangeRateResponse = null;
        Map<String, Object> mapJsonData = new Map<String, Object>();        
        Web_Service_Config__mdt webServiceConfig = Web_Service_Config__mdt.getInstance('CurrencyExchangeRate');

        List<String> apiQueryParameters = new List<String>();
        apiQueryParameters.add(fromCurrencyValue);
        apiQueryParameters.add(toCurrencyValue);
        apiQueryParameters.add(webServiceConfig.apiKey__c);
        
        String endpoint = String.format(webServiceConfig.endpoint__c, apiQueryParameters);

        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint(endpoint);
        httpRequest.setMethod(webServiceConfig.httpMethod__c);
        httpRequest.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
        httpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());

        try {
            Http http = new Http();
            HttpResponse httpResponse  = http.send(httpRequest);
            if (httpResponse.getStatusCode() == 200) {
                currencyExchangeRateResponse = httpResponse.getBody();
            } else {
                throw new CalloutException(httpResponse.getBody());
            }
        } catch (Exception e) {
            throw e;
        }

        if(String.isNotBlank(currencyExchangeRateResponse)) {
            mapJsonData = (Map<String,Object>) JSON.deserializeUntyped(currencyExchangeRateResponse);
            System.debug('mapJsonData = ' + mapJsonData);
        }

        return mapJsonData;
    }
}
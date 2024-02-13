/**
 * @description       : API call to get currency exchange rate.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-13-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CurrencyConversionController {

    @AuraEnabled
    public static Map<String, Object> retrieveCurencyConversionRates(String fromCurrencyValue, String toCurrencyValue) {
        Web_Service_Config__mdt webServiceConfig = Web_Service_Config__mdt.getInstance('CurrencyExchangeRate'); 

        Map<String, Object> mapJsonData = new Map<String, Object>();
        String strResponse = null;
        //String endpoint = 'https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency='+ fromCurrencyValue +'&to_currency=' + toCurrencyValue
            //+'&apikey=PNSMD5PNMH0VMF5P';
        String endpoint = 'https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency='+ fromCurrencyValue +'&to_currency=' + toCurrencyValue
        +'&apikey=' + webServiceConfig.apiKey__c;
        
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint(endpoint);
        //httpRequest.setMethod('GET');
        httpRequest.setMethod(webServiceConfig.httpMethod__c);
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

        if(String.isNotBlank(strResponse)) {
            mapJsonData = (Map<String,Object>) JSON.deserializeUntyped(strResponse);
            System.debug('mapJsonData = ' + mapJsonData);
        }

        return mapJsonData;
    }
}
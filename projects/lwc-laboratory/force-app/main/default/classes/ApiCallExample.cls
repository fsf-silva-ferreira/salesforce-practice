/**
 * @description       : 
 * @author            : flavio.ferreira
 * @group             : 
 * @last modified on  : 04-25-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ApiCallExample {

    //https://salesforce.stackexchange.com/questions/107584/accessing-static-resource-in-apex

    @AuraEnabled
    public static ResponseWrapper callApiSuccessResponseTrue() {        
        StaticResource apiSuccessResponseTrue = 
        [
            SELECT 
                Id
                , Name
                , body
            FROM 
                StaticResource 
            WHERE 
                Name = 'API_Success_True'
        ];

        return  new ResponseWrapper(200, apiSuccessResponseTrue.Body.toString());
    }

    @AuraEnabled
    public static ResponseWrapper callApiSuccessResponseFalse() {
        StaticResource apiSuccessResponseFalse = 
        [
            SELECT 
                Id
                , Name
                , body
            FROM 
                StaticResource 
            WHERE 
                Name = 'API_Success_False'
        ];

        return new ResponseWrapper(200, apiSuccessResponseFalse.Body.toString());
    }

    @AuraEnabled
    public static ResponseWrapper callApiErrorResponse() {
        StaticResource apiErrorResponse = 
        [
            SELECT 
                Id
                , Name
                , body
            FROM 
                StaticResource 
            WHERE 
                Name = 'API_Error_Response'
        ];

        ResponseWrapper responseWrapper = new ResponseWrapper(500,  apiErrorResponse.Body.toString());

        return responseWrapper;
    }

    @AuraEnabled
    public static ResponseWrapper lookupZipCode() {
        String zipCode = '37550001';

        HttpRequest request = new HttpRequest();
        request.setEndpoint('viacep.com.br/ws/' + zipCode + '/json/');
        request.setMethod('GET');

        Http http = new Http();
        HTTPResponse response = http.send(request);
        System.debug('API response body: ' + response.getBody());  
        
        ResponseWrapper responseWrapper = new ResponseWrapper(response.getStatusCode(),  response.getBody());

        return responseWrapper;
    }

    public with sharing class ResponseWrapper {

        //https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_properties.htm
        
        @AuraEnabled
        public Integer httpCode {get; set;}

        @AuraEnabled
        public String responseBody {get; set;}

        public ResponseWrapper(Integer httpCode, String responseBody) {
            this.httpCode = httpCode;
            this.responseBody = responseBody;
        }
    }
}
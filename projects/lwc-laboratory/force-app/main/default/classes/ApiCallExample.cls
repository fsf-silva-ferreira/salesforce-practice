/**
 * @description       : 
 * @author            : flavio.ferreira
 * @group             : 
 * @last modified on  : 04-02-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ApiCallExample {

    @AuraEnabled
    public static ResponseWrapper callApiSuccessResponseTrue() {        
        //https://salesforce.stackexchange.com/questions/107584/accessing-static-resource-in-apex
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

        return new ResponseWrapper(200, apiSuccessResponseTrue.body.toString());
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

        return new ResponseWrapper(200, apiSuccessResponseFalse.body.toString());
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

        return new ResponseWrapper(500, apiErrorResponse.body.toString());
    }

    public class ResponseWrapper {

        Integer httpCode {get; set;}
        String responseBody {get; set;}

        public ResponseWrapper(Integer httpCode, String responseBody) {
            this.httpCode = httpCode;
            this.responseBody = responseBody;
        }
    }
}
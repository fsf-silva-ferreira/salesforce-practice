/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-10-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AdocaoPetController {

    @AuraEnabled
    public static string getAnimal(string tipoPet){
        String endpointCat = 'https://api.thecatapi.com/v1/images/search?breed_ids=beng&include_breeds=true';
        String endpointRandomDog = 'https://dog.ceo/api/breeds/image/random';
        HttpRequest req = new HttpRequest();
        HttpResponse resp = new HttpResponse();
        
        try{
            req.setHeader('Content-Type', 'application/json');  
            req.setMethod('GET');
            if(tipoPet == 'Gato'){
                req.setEndpoint(endpointCat);   
            }else{
                req.setEndpoint(endpointRandomDog);  
            }
        
            resp = new Http().send(req);
            System.debug('response code: ' + resp.getStatusCode() + '|' + resp.getBody());
            if(resp.getStatusCode() == 200){
                return resp.getBody();
            }else{
                return '{ "error" : true, "message" : "' + resp.getStatusCode() + ' - ' + resp.getBody() + '" }';
            }
        }catch(Exception ex){
            return '{ "error" : true, "message" : "' + ex.getMessage() + '" }';
        }
    }
}

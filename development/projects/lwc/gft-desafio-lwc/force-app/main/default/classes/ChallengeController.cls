/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-13-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ChallengeController {

    @AuraEnabled
    public static string getCandidate(string sexo){
        String maleEndpoint = 'https://randomuser.me/api/?gender=male';
        String femaleEndpoint = 'https://randomuser.me/api/?gender=female';        
        HttpRequest req = new HttpRequest();
        HttpResponse resp = new HttpResponse();
        
        try{
            req.setHeader('Content-Type', 'application/json');  
            req.setMethod('GET');

            if(sexo == 'Masculino') {
                req.setEndpoint(maleEndpoint);  
            } else {
                req.setEndpoint(femaleEndpoint);    
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

/**
 * @description       : 
 * @author            : Flávio Ferreira
 * @group             : GFT
 * @last modified on  : 09-09-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class BuscaCepController {

    @AuraEnabled
    public static Map<String, Object> buscaCep(String codigoCep){
        try {
            Http protocolo = new Http();

            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://viacep.com.br/ws/' + codigoCep + '/json/');
            request.setMethod('GET');

            //Encapsula dentro do protocolo HTTP e envia o request
            HttpResponse response = protocolo.send(request);
            if(response.getStatusCode() == 200) {
                Map<String, Object> dataMap = /*Type casting*/ (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

                return dataMap;
            } else 
            if(response.getStatusCode() == 400) {
                throw new AuraHandledException('Bad Request 400');
            } else {
                return null;
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}

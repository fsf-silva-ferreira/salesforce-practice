/**
 * @description       : Apex server-side controller.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-09-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
//* with sharing = We don't want anybody who doesn't have access to this records os the object.
public with sharing class SimpleServerSideController {
    
    //* static = Stateless
    //* @AuraEnabled = Client-side component has access to this server-side method
    @AuraEnabled 
    public static String serverEcho(String firstName) {
        return 'Hello from the server ' + firstName;
    }
}
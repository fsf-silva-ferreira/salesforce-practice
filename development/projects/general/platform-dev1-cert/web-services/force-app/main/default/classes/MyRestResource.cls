/**
 * @description       : Expose a class as a REST service.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-02-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_rest.htm
**/
@RestResource(UrlMapping='/Account/*')
global with sharing class MyRestResource {
    
    @HttpGet
    global static Account getRecord() {
        //Add your code
        return new Account(Name='REST Service Account');
    }
}
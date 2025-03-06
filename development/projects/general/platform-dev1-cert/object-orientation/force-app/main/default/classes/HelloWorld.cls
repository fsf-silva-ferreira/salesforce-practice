/**
 * @description       : Basic concepts about object-oriented design.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_defining.htm
**/
public with sharing class HelloWorld {
    
    public void printMessage() {
        String message = 'Hello World!';
        System.debug(message);
    }
}
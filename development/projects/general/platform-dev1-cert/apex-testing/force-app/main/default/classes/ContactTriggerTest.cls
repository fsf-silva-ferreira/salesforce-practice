/**
 * @description       : Practicing trigger testing.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-25-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class ContactTriggerTest {
    
    @IsTest
    private static void testContactTrigger() {
        System.Test.startTest();

        Contact myContact = new Contact();
        myContact.LastName = 'Platform Developer I';        
        insert myContact;

        Integer contactCount = [SELECT count() FROM Contact];

        System.assert(contactCount == 1);

        System.Test.stopTest();
    }
}
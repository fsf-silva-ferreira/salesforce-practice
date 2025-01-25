/**
 * @description       : Practicing unit tests.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public class AccountClassTest {
   
    @IsTest
    private static void testAccountWithContact() {
        System.Test.startTest();

        AccountClass.createAccountWithContact();
        Integer contactCount = [SELECT count() FROM Contact];

        System.assert(contactCount == 1);
        
        System.Test.stopTest();
    }
}
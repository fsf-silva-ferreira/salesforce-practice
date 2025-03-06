/**
 * @description       : This class uses custom exception.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CustomExceptionUsage {
    
    public static void processMain() {
        try{
            insertAccount();
        } catch(AccountException accountException) {
            System.debug('Messsage: ' + accountException.getMessage());
            System.debug('Cause: ' + accountException.getCause());
            System.debug('Line number: ' + accountException.getLineNumber());
        }
    }

    public static void insertAccount() {
        try{
            Account myAccount = new Account();
            insert myAccount;            
        } catch(DmlException dmlException) { //Triggering a validation rule causes a DML Exception
            throw new AccountException('Account cannot be created because the required field \'Name\' is missing.', dmlException);
        }
    }
}
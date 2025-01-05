/**
 * @description       : Examples of variable declarations.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-21-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class VariableDeclaration {

    public VariableDeclaration() {
        /*
            The following variable has the data type of Integer with the name count, 
            and has the value of 0.
        */
        Integer count = 0;

        /* 
            The following variable has the data type of Decimal with the name total. Note 
            that no value has been assigned to it.
        */
        Decimal total;
        
        // The following variable is an account, which is also referred to as an sObject.
        Account myAcct = new Account();
    }
}
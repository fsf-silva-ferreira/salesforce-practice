/**
 * @description       : Acess to Account object.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 12-09-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountHelper {
    
    /**
     * Get the fields Id, Name, Type, Rating, Phone, Website, AnnualRevenue from an Account list.
     * 
     *  */    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return  [
                    SELECT 
                        Id, Name, Type, Rating, Phone, Website, AnnualRevenue
                    FROM Account
                ];
    }
}
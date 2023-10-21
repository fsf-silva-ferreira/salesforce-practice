/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-26-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountService {

  @AuraEnabled(cacheable=true)
  public static List<Account> getAccounts(String accountName) {

    String stringKey = '%' + accountName + '%';
    List<Account> accList = 
      [
        SELECT 
          Id,
          Name,
          AccountNumber 
        FROM 
          Account 
        WHERE 
          name like :stringKey 
      ];

    return accList;
  }
}
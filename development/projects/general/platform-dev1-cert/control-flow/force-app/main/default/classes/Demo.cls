/**
 * @description       : Apex introduction.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-28-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Based on: https://www.youtube.com/watch?v=KSqvJSUb1D4&list=PL57B82Dd6pFffk4dNNG4XzeBXYpnyEjQt&index=10
**/
public with sharing class Demo {

    private String name;
    private List<String> testList = new List<String>();

    public Demo(String aName) {
        name = aName;
    }

    public void showHello() {
        if(name != null) {
            System.debug('Hello World ' + name);
        } else {
            System.debug('Hello World ');
        }        
    }

    public static void createAccountBadPractice() {
        for(Integer i=0; i<2; i++) {
            Account anAccount = new Account();
            anAccount.name = 'Test Account Object ' + String.valueOf(i+1);
            insert anAccount;
        }
    }

    public static void createAccountGoodPractice() {
        List<Account> listOfAccounts = new List<Account>();

        for(Integer i=0; i<160; i++) {
            Account accountRecord = new Account();
            accountRecord.name = 'Test Account ' + String.valueOf(i+1);
            listOfAccounts.add(accountRecord);
        }

        insert listOfAccounts;
    }

    public static List<SObject> getAccounts() {
        List<SObject> accounts = new List<SObject>();

        try{
            accounts = [SELECT Id, Name FROM Account LIMIT 5];
        } catch (Exception e) {
            System.debug(e.getMessage());
        }

        return accounts;
    }
}
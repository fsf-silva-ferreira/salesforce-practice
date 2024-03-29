/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-09-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountService {

    public Account createAccount(String accountName, String accountNumber, String tickerSymbol) {
        Account newAcct = new Account(
          Name = accountName,
          AccountNumber = accountNumber,
          TickerSymbol = tickerSymbol
        );
      
        return newAcct;
    }
  }
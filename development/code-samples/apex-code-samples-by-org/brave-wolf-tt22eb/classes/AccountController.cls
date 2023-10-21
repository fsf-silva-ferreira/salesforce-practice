/**
 * @description       : 
 * @author            : Flávio da Silva Ferreira
 * @group             : 
 * @last modified on  : 03-12-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   03-11-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class AccountController {
    /*
        Anotamos o método com @AuraEnabled(cacheable=true) para que os resultados sejam armazenados 
        em cache.
    */
    @AuraEnabled(cacheable=true)
    /*
        Definimos o método getAccounts no Apex para realizar uma operação de leitura e recuperar 
        contas existentes.
    */
    public static List<Account> getAccounts() {
        /*
        return [
            SELECT Name, AnnualRevenue, Industry
            FROM Account
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];
        */

        throw new AuraHandledException('Forced Error');
    }
}
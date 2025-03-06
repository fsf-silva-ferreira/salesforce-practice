/**
 * @description       : Working with SOQL Aggregate Functions: COUNT().
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-01-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class SoqlCount {
    
    public static Integer getTotalOfBilligAddressAccounts() {
        AggregateResult[] accountCountIdResults = [
            SELECT 
                COUNT(ID) totalAccountsWithBillingAddress
            FROM
                Account 
            WHERE
                BillingCity != null AND
                BillingCountry != null
        ];

        Object countId = accountCountIdResults[0].get('totalAccountsWithBillingAddress');
        Integer totalAccountsWithBillingAddress = (Integer) countId;

        System.debug('COUNT() result to return: ' + totalAccountsWithBillingAddress);

        return totalAccountsWithBillingAddress;
    }
}
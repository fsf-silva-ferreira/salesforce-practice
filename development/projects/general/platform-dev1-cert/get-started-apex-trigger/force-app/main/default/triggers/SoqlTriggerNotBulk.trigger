/**
 * @description       : Performing Bulk SOQL. --> AVOID THIS PATTERN!! <--
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger SoqlTriggerNotBulk on Account(after update) {

    System.debug('SoqlTriggerNotBulk trigger');

    for(Account accountToUpdate : Trigger.new) {
        /*
            Get child records for each account
            Inefficient SOQL query as it runs once for each account!
        */
        Opportunity[] opps = [
            SELECT 
                Id
                ,Name
                ,CloseDate
            FROM 
                Opportunity 
            WHERE 
                AccountId = :accountToUpdate.Id
        ];

        // Do some other processing
    }
}
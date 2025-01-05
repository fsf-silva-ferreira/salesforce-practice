/**
 * @description       : Bulk Design Pattern in Action for modified AddRelatedRecord trigger.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AddRelatedRecordModified on Account(after insert, after update) {

    System.debug('AddRelatedRecordModified trigger');

    List<Opportunity> opportunityList = new List<Opportunity>();
    /* 
        Add an opportunity for each account if it doesn't already have one.
        Iterate over accounts that are in this trigger but that don't have opportunities.
    */
    List<Account> accountsToProcess = null;
    switch on Trigger.operationType {
        when AFTER_INSERT {
            // All inserted Accounts will need the Opportunity, so there is no need to perform the query
            accountsToProcess = Trigger.New;
        }
        when AFTER_UPDATE {
            accountsToProcess = [
                SELECT 
                    Id
                    ,Name 
                FROM 
                    Account
                WHERE 
                    Id 
                IN 
                    :Trigger.New AND
                    Id NOT IN (
                        SELECT 
                            AccountId 
                        FROM 
                            Opportunity 
                        WHERE 
                            AccountId in :Trigger.New
                    )
            ];
        }
    }

    for (Account accountToProcess : accountsToProcess) {
        // Add a default opportunity for this account
        Opportunity newOpportunity = new Opportunity(
            Name = accountToProcess.Name + ' Opportunity',
            StageName = 'Prospecting',
            CloseDate = System.today().addMonths(1),
            AccountId = accountToProcess.Id
        );

        opportunityList.add(newOpportunity);
    }

    if (opportunityList.size() > 0) {
        insert opportunityList;
    }
}
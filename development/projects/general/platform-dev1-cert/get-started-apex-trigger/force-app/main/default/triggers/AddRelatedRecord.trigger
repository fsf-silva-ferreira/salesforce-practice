/**
 * @description       : This trigger adds a related opportunity for each new or updated account if no opportunity is already associated with the account.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AddRelatedRecord on Account(after insert, after update) {

    System.debug('AddRelatedRecord trigger');

    // Get the related opportunities for the accounts in this trigger
    Map<Id,Account> accountsWithOpportunities = new Map<Id,Account>(
        [
            SELECT 
                Id
                ,(SELECT Id FROM Opportunities) 
            FROM 
                Account 
            WHERE 
                Id 
            IN 
                :Trigger.new
        ]
    );

    // Add an opportunity for each account if it doesn't already have one.
    // Iterate through each account.
    List<Opportunity> newOpportunities = new List<Opportunity>();
    for(Account newAccount : Trigger.new) {
        System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + accountsWithOpportunities.get(newAccount.Id).Opportunities.size());
        // Check if the account already has a related opportunity.
        if (accountsWithOpportunities.get(newAccount.Id).Opportunities.size() == 0) {
            // If it doesn't, add a default opportunity
            Opportunity newOpportunity = new Opportunity(
                Name      = newAccount.Name + ' Opportunity',
                StageName = 'Prospecting',
                CloseDate = System.today().addMonths(1),
                AccountId = newAccount.Id
            );
            newOpportunities.add(newOpportunity);
        }
    }

    if (newOpportunities.size() > 0) {
        insert newOpportunities;
    }
}
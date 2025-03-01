/**
 * @description       : This example shows a best practice for running SOQL queries.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger SoqlTriggerBulk on Account(after update) {

    System.debug('SoqlTriggerBulk trigger');

    /*
        Perform SOQL query once.
        Get the accounts and their related opportunities.
    */
    List<Account> accountsWithOpportunities = [
        SELECT 
            Id
            ,Name
            ,(SELECT Id,Name,CloseDate FROM Opportunities)
         FROM 
            Account 
        WHERE 
            Id IN :Trigger.new
    ];
    
    // Iterate over the returned accounts
    for(Account accountToUpdate : accountsWithOpportunities) {
        Opportunity[] relatedOpportunities = accountToUpdate.Opportunities;
        // Do some other processing
        if(relatedOpportunities.size() > 0) {
            System.debug('The account ' + accountToUpdate.Name + ' has ' + relatedOpportunities.size() + ' opportunities:');
            for(Opportunity relatedOpportunity : relatedOpportunities) {
                System.debug('  --> ' + relatedOpportunity.Name);    
            }
        }
    }
}
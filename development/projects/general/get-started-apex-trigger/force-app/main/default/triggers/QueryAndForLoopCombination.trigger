/**
 * @description       : Combining the SOQL query with the for loop in one statement: the SOQL for loop. 
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger QueryAndForLoopCombination on Account (before insert) {
    
    System.debug('QueryAndForLoopCombination trigger');   

    /* 
        Perform SOQL query once.
        Get the related opportunities for the accounts in this trigger,
        and iterate over those records.
    */
    for(Opportunity relatedOpportunity : 
        [
            SELECT 
                Id
                ,Name
                ,CloseDate 
            FROM 
                Opportunity
            WHERE 
                AccountId IN :Trigger.new
        ]) 
    {
        System.debug('  --> ' + relatedOpportunity.Name);   
    }
}
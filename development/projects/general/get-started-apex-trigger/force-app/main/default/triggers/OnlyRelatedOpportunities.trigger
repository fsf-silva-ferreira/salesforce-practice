/**
 * @description       : Retrieving only the opportunities that are related to the accounts within this trigger context.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger OnlyRelatedOpportunities on Account (before insert) {

    System.debug('OnlyRelatedOpportunities trigger'); 

    /* 
        Perform SOQL query once.
        Get the related opportunities for the accounts in this trigger.
    */
    List<Opportunity> relatedOpportunities = [
        SELECT 
            Id
            ,Name
            ,CloseDate 
        FROM 
            Opportunity
        WHERE 
            AccountId 
        IN :Trigger.new
    ];

    // Iterate over the related opportunities
    for(Opportunity relatedOpportunity : relatedOpportunities) {
        System.debug('  --> ' + relatedOpportunity.Name);   
    }
}
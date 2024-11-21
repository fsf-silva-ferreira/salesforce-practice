/**
 * @description       : Using trigger exceptions.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AccountDeletion on Account (before delete) {
    List<Account> accountsToDelete = [
        SELECT 
            Id 
        FROM 
            Account
        WHERE 
            Id 
        IN 
            (SELECT AccountId FROM Opportunity) AND
            Id IN :Trigger.old
    ];

    // Prevent the deletion of accounts if they have related opportunities.
    for (Account accountToDelete : accountsToDelete) {
        Trigger.oldMap.get(accountToDelete.Id).addError(
            'Cannot delete account with related opportunities.'
        );
    }
}
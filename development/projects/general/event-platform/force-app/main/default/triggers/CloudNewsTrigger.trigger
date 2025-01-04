/**
 * @description       : Listening Cloud_News__e records after insert and calling handler class to consume Cloud_News__e events.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger CloudNewsTrigger on Cloud_News__e (after insert) {
    System.debug('--> Consumer start');
    
    // List to hold all cases to be created.
    List<Case> cases = new List<Case>();
    // Get queue Id for case owner
    Group queue = [SELECT Id FROM Group WHERE Name='Regional Dispatch' AND Type='Queue'];
    
    System.debug('Queue retrieved: ' + queue);
    
    // Iterate through each notification.
    for (Cloud_News__e event : Trigger.New) {
        if (event.Urgent__c == true) {
            // Create Case to dispatch new team.
            Case eventCase = new Case();
            eventCase.Priority = 'High';
            eventCase.Subject = 'News team dispatch to ' + event.Location__c;
            eventCase.OwnerId = queue.Id;
            eventCase.Status = 'Open';
            
            System.debug('Case created: ' + eventCase);
            
            cases.add(cs);
        }
   }
    
   // Insert all cases corresponding to events received.
   insert cases;    
   System.debug('Cases inserted: ' + cases.size());
    
   System.debug('--> Consumer end');
}
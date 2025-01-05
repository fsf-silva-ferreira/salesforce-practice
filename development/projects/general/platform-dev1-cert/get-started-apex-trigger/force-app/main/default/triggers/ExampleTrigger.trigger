/**
 * @description       : Calling a class method from a Trigger.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        String insertMessage;
        Integer recordCount = Trigger.new.size();   

        if(recordCount > 1) {
            insertMessage = recordCount + ' contact(s) were inserted:\n';
        } else {
            insertMessage = '1 contact was inserted:\n';
        }
        
        String contactsInserted = '';
        for(Contact newContact : Trigger.new) {
            contactsInserted += 'ID ' + newContact.Id + ' - ' + newContact.FirstName + ' ' + newContact.LastName + '\n';
        }

        // Call a utility method from another class
        EmailManager.sendMail(
            UserInfo.getUserEmail(), 
            'Trailhead Trigger Tutorial',
            insertMessage + contactsInserted
        );
    } else 
    if (Trigger.isDelete) {
        // Process after delete
    }
}
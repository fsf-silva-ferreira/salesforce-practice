/**
 * @description       : Creating tasks with OpportunityChangeEvent messages data.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Reference:
 * https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_change_event.htm
 * 
**/
public with sharing class OpportunityChangeHandler {
        
    //* New OpportunityChangeEvent tasks process
    public static void createOpportunityChangeEventTasks(List<OpportunityChangeEvent> opportunityChangeEventMessages) {
        System.debug('createOpportunityChangeEventTasks');

        List<Task> tasks = new List<Task>();
        for (OpportunityChangeEvent eventMessage : opportunityChangeEventMessages) {
            EventBus.ChangeEventHeader header = eventMessage.ChangeEventHeader;

            System.debug(
                'Received change event for ' + header.entityName + 
                ' for the ' + header.changeType + ' operation.'
            );

            displayChangedFieldLogs(header, eventMessage);
            tasks = createTaskToList(header, eventMessage, tasks);
        }
        
        insertTasks(tasks);
    }


    //* Process steps definition
    public static void displayChangedFieldLogs(EventBus.ChangeEventHeader header, OpportunityChangeEvent eventMessage) {
        if (header.changetype == 'UPDATE') {
            System.debug('List of all changed fields:');
            for (String field : header.changedFields) {
                if (null == eventMessage.get(field)) {
                    System.debug('Deleted field value (set to null): ' + field);
                } else {
                    System.debug('Changed field value: ' + field + '. New Value: '
                                + eventMessage.get(field));
                }
            }
        }
    }

    public static List<Task> createTaskToList(EventBus.ChangeEventHeader header, OpportunityChangeEvent eventMessage, List<Task> tasks) {
        if ((header.changetype == 'UPDATE') && (eventMessage.isWon == true)) {        
            Task task = new Task();
            task.Subject = 'Follow up on won opportunities: ' + header.recordIds;
            task.OwnerId = header.CommitUser;

            tasks.add(task);
        }  

        return tasks;
    }

    public static void insertTasks(List<Task> tasks) {        
        if (tasks.size() > 0) {
            insert tasks;
        }
    }
}
/**
 * @description       : Creating tasks with Employee__ChangeEvent messages data.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class EmployeeChangeHandler {

    //* Process for new change event tasks
    public static void createEmployeeChangeEventTasks(List<Employee__ChangeEvent> employeeChangeEventMessages) {
        List<Task> tasks = new List<Task>();
        for (Employee__ChangeEvent eventMessage : employeeChangeEventMessages) {
            EventBus.ChangeEventHeader header = eventMessage.ChangeEventHeader;

            System.debug(
                'Received change event for ' + header.entityName + 
                ' for the ' + header.changeType + ' operation.'
            );
           
            displayChangedFieldLogs(header, eventMessage);
            displayEventLogs(eventMessage);
            tasks.add(createFollowupTask(header));
        }

        insertTasks(tasks);
    }
    

    //* Process steps definitions
    private static void displayChangedFieldLogs(EventBus.ChangeEventHeader header, Employee__ChangeEvent eventMessage) {        
        if (header.changetype == 'UPDATE') {
           System.debug('List of all changed fields:');

           for (String field : header.changedFields) {
               if (null == eventMessage.get(field)) {
                   System.debug('Deleted field value (set to null): ' + field);
               } else {
                   System.debug('Changed field value: ' + field + '. New Value: ' + eventMessage.get(field));
               }
           }
       }
    }

    private static void displayEventLogs(Employee__ChangeEvent eventMessage) {        
        System.debug('Some Employee record field values from the change event:');

        if (eventMessage.First_Name__c != null) {
            System.debug('First Name: ' + eventMessage.First_Name__c);
        }
        if (eventMessage.Last_Name__c != null) {
            System.debug('Last Name: ' + eventMessage.Last_Name__c);
        }
        if (eventMessage.Name != null) {
            System.debug('Name: ' + eventMessage.Name);
        }
        if (eventMessage.Tenure__c != null) {
            System.debug('Tenure: ' + eventMessage.Tenure__c);
        }
    }

    private static Task createFollowupTask(EventBus.ChangeEventHeader header) {
        Task followupTask = new Task();
        followupTask.Subject = 'Follow up on employee record(s): ' + header.recordIds;
        followupTask.OwnerId = header.CommitUser;

        return followupTask;
    }

    private static void insertTasks(List<Task> tasks) {
        if (tasks.size() > 0) {
            insert tasks;
        }
    }
}
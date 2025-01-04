/**
 * @description       : Listening Employee__c change events to call handler class for tasks creation.
 * @author            : Flávio da silva Ferreira
 * @group             : 
 * @last modified on  : 01-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger EmployeeChangeTrigger on Employee__ChangeEvent (after insert) {

  EmployeeChangeHandler.createEmployeeChangeEventTasks( employeeChangeEventMessages);
}
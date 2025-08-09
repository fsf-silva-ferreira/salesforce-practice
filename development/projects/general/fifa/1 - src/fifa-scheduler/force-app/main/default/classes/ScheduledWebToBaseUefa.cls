/**
 * @description       : Schedulable UEFA web-to-base process.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 08-09-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ScheduledWebToBaseUefa implements Schedulable {

    public void execute(SchedulableContext schedulableContext) {
        FootballAssociationController.runWebToBaseUefa();
    }
}
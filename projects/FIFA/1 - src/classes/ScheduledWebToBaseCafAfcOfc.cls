/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-14-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ScheduledWebToBaseCafAfcOfc implements Schedulable {

    public void execute(SchedulableContext sc) {
        FootballAssociationController.runWebToBaseCafAfcOfc();
    }
}

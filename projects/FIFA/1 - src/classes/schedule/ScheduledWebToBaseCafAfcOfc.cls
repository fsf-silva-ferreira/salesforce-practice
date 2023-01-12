/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-11-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
global class ScheduledWebToBaseCafAfcOfc implements Schedulable {

    global void execute(SchedulableContext sc) {
        FootballAssociationController.runWebToBaseCafAfcOfc();
    }
}

/**
 * @description       : Code coverage in Apex.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class TaskUtility {
    
    public static String getTaskPriority(String leadCountry) {
        if(String.isBlank(leadCountry) || leadCountry.length() > 2) {
            return null;
        }

        String taskPriority;
        if(leadCountry == 'US') {
            taskPriority = 'High';
        } else {
             taskPriority = 'Normal';
        }

        return taskPriority;
    }
}
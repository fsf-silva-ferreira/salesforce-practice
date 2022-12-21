/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-21-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DatabaseErrorManager {

    public static String handleSaveResults(List<Database.SaveResult> saveResults) {
        String errorMessages = '';

        for (Database.SaveResult saveResult : saveResults) {
            if (!saveResult.isSuccess()) {
                for(Database.Error err : saveResult.getErrors()) {                    
                    errorMessages += saveResult + '\n';
                }

                errorMessages += '\n\n';
            }
        }

        return errorMessages;
    }
}

/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-19-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DatabaseErrorManager {

    public static String handleSaveResults(List<Database.SaveResult> saveResults) {
        String errorMessages = '';

        for (Database.SaveResult saveResult : saveResults) {
            if (!saveResult.isSuccess()) {
                for(Database.Error err : saveResult.getErrors()) {
                    errorMessages += 'The following error has occurred: ' + err.getMessage() + ' | Fields affected: ' + err.getFields() + '\n';
                }

                errorMessages += '\n\n';
            }
        }

        return errorMessages;
    }
}

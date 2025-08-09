/**
 * @description       : Managing errors that occurred during a DML operation when using a Database method.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 08-08-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * External links:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_dml_examples_upsert.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database.htm#apex_System_Database_upsert
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database_error.htm
**/
public with sharing class DatabaseErrorManager {

    public static String handleSaveResults(List<Database.SaveResult> saveResults) {
        String saveErrorMessages = '';

        for (Database.SaveResult saveResult : saveResults) {
            if (!saveResult.isSuccess()) {
                for(Database.Error err : saveResult.getErrors()) {                    
                    saveErrorMessages += saveResult + '\n';
                }

                saveErrorMessages += '\n\n';
            }
        }

        return saveErrorMessages;
    }

    public static String handleUpsertResults(List<Database.UpsertResult> upsertResults) {
        String upsertErrorMessages = '';

        for (Database.UpsertResult upsertResult : upsertResults) {
            if (!upsertResult.isSuccess()) {
                for(Database.Error upsertError : upsertResult.getErrors()) {                    
                    upsertErrorMessages += upsertError.getMessage() + '\n';
                }

                upsertErrorMessages += '\n\n';
            }
        }

        return upsertErrorMessages;
    }
}
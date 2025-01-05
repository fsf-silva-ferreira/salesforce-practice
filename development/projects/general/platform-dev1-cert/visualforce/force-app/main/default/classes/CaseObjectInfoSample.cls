/**
 * @description       : Displaying all record types and Status__c picklist values of the Case object.
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-03-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CaseObjectInfoSample {

    //* See doc: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Schema_RecordTypeInfo.htm
    public static List<RecordTypeInfo> getCaseRecordTypeInfo() {
        return Case.SObjectType.getDescribe().getRecordTypeInfos();
    }

    public static List<Schema.PicklistEntry> getCaseStatusPicklistValues() {
        return Case.Status.getDescribe().getSObjectField().getDescribe().getPicklistValues();
    }
}
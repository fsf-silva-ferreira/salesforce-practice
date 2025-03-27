/**
 * @description       : Practice Dynamic Apex: Schema namespace classes and methods, and the Schema class.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-08-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_schema.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_namespace_Schema.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Schema_SObjectType.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Schema_SObjectField.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Schema_ChildRelationship.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_schema_describetabresult.htm
**/
public class SchemaExample {
    
    public static void runGlobalDescribe() {
        List<Schema.SObjectType> sObjectTypes = Schema.getGlobalDescribe().values();

        System.debug('Total of objects: ' + sObjectTypes.size());
        for(Schema.SObjectType sObjectTypeElement : sObjectTypes) {
            System.debug('Object name: ' + sObjectTypeElement.getDescribe().getName() +
                ' fields => ' + sObjectTypeElement.getDescribe().fields.getMap().values());
        }        
    }

    public static void displayAccountObjectFields() {
        //The getSObjectType() method returns the schema.SObjectType object for the sObject, 
        //which can be used to create a similar sObject using the newSObject() method.
        System.debug('SObjectType: ' + Account.getSObjectType());

        Schema.DescribeSObjectResult accountDescribe = Account.SObjectType.getDescribe();
        Map<String,Schema.SObjectField> accountDescribeFields = accountDescribe.fields.getMap();

        for(Schema.SObjectField accountDescribeField : accountDescribeFields.values()) {
            System.debug('Field: ' + accountDescribeField);
            List<Schema.PicklistEntry> picklistEntries = accountDescribeField.getDescribe().getPicklistValues();

            if(picklistEntries.size() > 0) {
                System.debug('It is a picklist field');
                for(Schema.PicklistEntry picklistEntry : picklistEntries) {
                    System.debug('Label = ' + picklistEntry.getLabel() + ' | Value: ' + picklistEntry.getValue());    
                }
            }
        }
    }

    public static void displayAccountChildRelationships() {
        Schema.DescribeSObjectResult accountDescribe = Account.SObjectType.getDescribe();        
        List<Schema.ChildRelationship> listOfChildRelationships = accountDescribe.getChildRelationships();

        for(Schema.ChildRelationship childRelationshipElement : listOfChildRelationships) {
            if(childRelationshipElement.getRelationshipName() != null) {
                System.debug('Relationship name: ' + childRelationshipElement.getRelationshipName());
            }
        }
    }

    public static void displayDescribeTabs() {
        List<Schema.DescribeTabSetResult> describeTabSet = Schema.describeTabs();
        System.debug('describeTabSet: ' + describeTabSet);
    }

    public static void displayAppTabs(String appName) {
        List<Schema.DescribeTabSetResult> describeTabSet = Schema.describeTabs();

        for(Schema.DescribeTabSetResult tabSetResult : describeTabSet) {
            if(tabSetResult.getLabel() == appName) {
                List<Schema.DescribeTabResult> tabDescriptions = tabSetResult.getTabs();

                System.debug('Tabs associatted with \'' + appName + '\' application:');
                for(Schema.DescribeTabResult tab : tabDescriptions) {
                    System.debug('Tab label: ' + tab.getLabel());
                }
            }
        }

        System.debug('**************************************************************');
    }

    public static void displayRequiredFields(String objectName) {  
        //Breakdown block      
        Map<String, Schema.SObjectType> globalDescribeMap = Schema.getGlobalDescribe();    
        Schema.SObjectType salesforceObjectType = globalDescribeMap.get(objectName);
        Schema.DescribeSObjectResult objectDescribe = salesforceObjectType.getDescribe();
        Map<String,Schema.SObjectField> objectFields = objectDescribe.fields.getMap();

        //Display block
        System.debug('Dynamic Apex Breakdown');
        System.debug('Map contains: ' + globalDescribeMap);
        System.debug('\'' + objectName + '\' describe: ' + objectDescribe);
        System.debug('\'' + objectName + '\' fields: ' + objectFields);

        //Required fields loop block
        List<String> requiredFields = new List<String>();
        for(String field : objectFields.keySet()) {
            Schema.DescribeFieldResult describeField = objectFields.get(field).getDescribe();
            if(describeField.isCreateable() && !describeField.isNillable() && !describeField.isDefaultedOnCreate()) {
                requiredFields.add(field);
            }
        }

        //Display result
        System.debug('Required fields for the object \'' + objectName + '\' = ' + requiredFields);
    }
}
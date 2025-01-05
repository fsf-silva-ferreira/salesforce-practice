/**
 * @description       : Introduction to overriding methods.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-30-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Source: 
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_extending.htm
**/
public with sharing class ChildClass extends ParentClass {
    
    public override void showLog() {
        Super.showLog();
        System.debug('Child class');
    }
}
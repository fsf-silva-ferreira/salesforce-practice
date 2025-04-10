/**
 * @description       : Introduction to overriding methods.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_extending.htm
**/
public with sharing virtual class ParentClass {
    
    public virtual void showLog() {
        System.debug('Parent class');
    }
}
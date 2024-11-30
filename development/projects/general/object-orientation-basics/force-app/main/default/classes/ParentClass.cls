/**
 * @description       : Introduction to overriding methods.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-30-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing virtual class ParentClass {
    
    public virtual void showLog() {
        System.debug('Parent class');
    }
}
/**
 * @description       : Employee class.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_defining.htm
**/
public with sharing class Employee {
    
    public String name;
    public Integer age;
    public Integer salary;

    public void displayEmployeeInfo() {
        employeePrivateMethod();

        System.debug('Employee name: ' + name);
        System.debug('Employee age: ' + age);
        System.debug('Employee salary: ' + salary);
    }

    private void employeePrivateMethod() {
        System.debug('I am Employee private method');
    }
}
/**
 * @description       : Difference between static and non-static variables with example.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_static.htm
**/
public class Teacher {
    
    public String name;
    public Integer age;
    public static String schoolName;

    public void display() {
        System.debug('Teacher name: ' + name);
        System.debug('Teacher age: ' + age);
        System.debug('School name: ' + schoolName);
        System.debug('*********************************');
    }
}
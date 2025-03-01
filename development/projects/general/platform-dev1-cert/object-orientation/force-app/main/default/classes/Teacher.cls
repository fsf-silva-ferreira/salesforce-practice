/**
 * @description       : Difference between static and non-static variables with example.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-27-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
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
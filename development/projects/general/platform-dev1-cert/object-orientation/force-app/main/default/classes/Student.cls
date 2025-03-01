/**
 * @description       : Working with constructors.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-24-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Reference:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_constructors.htm
**/
public class Student {

    String name;
    String school;
    
    public Student(String name, String school) {
        this.name = name;
        this.school = school;
    }

    public Student() {
        this.name = 'Deepika';
        this.school = 'My Tutorial Rack';
    }    

    public void displayDetails() {
        System.debug('Name of the student: ' + name);
        System.debug('School name: ' + school);
    }
}
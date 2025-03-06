/**
 * @description       : Demonstrating difference between static and non-static variables.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_static.htm
**/
public with sharing class TeacherDemo {
    
    public static void runDemo () {
        Teacher teacher1 = new Teacher();
        //Storing data in one instance - non-static - variables
        teacher1.name = 'Flávio';
        teacher1.age = 47;
        //Storing data in static variable
        Teacher.schoolName = 'GFT';

        //Storing data in another instance - non-static - variables
        Teacher teacher2 = new Teacher();
        teacher2.name = 'Lu';
        teacher2.age = 53;
        //Storing data in static variable - this overwrites the previous value 'GFT'
        Teacher.schoolName = 'ONG';

        teacher1.display();
        teacher2.display();
    }
}
/**
 * @description       : Understanding the difference between static and non-static methods in Apex.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-26-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class StaticAndNotStaticMethodExample {
    
    Static Integer number1 = 10;
    Integer number2 = 20;

    public void method1() {
        System.debug('I am non-static method. You need to create the object of the class first to call me.');
        //Non-static methods can access both non-static and static variables
        System.debug('Inside method 1. STATIC number1 = ' + number1 + '  NON-STATIC number2 = ' + number2);
    }

    public static void method2() {
        System.debug('I am static method. You DO NOT need to create the object of the class. You can call me directly with class name.');
        //Static methods can ONLY access ststic variables.
        System.debug('Inside method 2. STATIC number1 = ' + number1 + '.');
    }
}
/**
 * @description       : Loops tell your application to do the same thing again and again based on a condition.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-21-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class TypesOfLoops {

    //A Do-while loop checks the condition after the code has executed.
    public static void runDoWhileLoop() {
        Integer i = 0;

        do {
            System.debug(i);
            i++;
        } while (i < 10);
    }

    //A While loop checks the condition at the start, before the code executes.
    public static void runWhileLoop() {
        Integer i = 0;

        while (i < 0) {
            System.debug(i);
            i++;   
        }
    }

    //A For loop enables you to more finely control the condition used with the loop.
    public static void runForLoop() {                
        for(Integer i = 0; i < 10; i++) {
            System.debug(i);
        }
    }
}
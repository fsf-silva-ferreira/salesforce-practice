/**
 * @description       : Working with loops: for loop, while loop, traditional, and list iteration.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class LoopController {

    public static void runTraditionalLoop() {
        for(Integer i = 0; i < 5; i++){
            System.debug('The number is ' + i );
        }
    }

    public static void runWhileLoop() {
        Integer i = 0;
        while (i < 5){
            System.debug('The number is ' + i);
            i++;
        }
    }

    public static void runForLoop() {
        for(Integer i = 0; i < 5; i++){
            System.debug('The number is ' + i );
        }
    }

    public static void runIterationLoop() {
        List <String> tea = new List<String>{'Black Tea', 'Green Tea', 'Chai Tea'};
        for(String t : tea){
            System.debug('We have ' + t);
        }
    }
}
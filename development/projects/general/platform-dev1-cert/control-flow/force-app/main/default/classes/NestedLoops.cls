/**
 * @description       : Placing a loop inside another loop is called nested loops.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class NestedLoops {
    
    public static void runExample() {
        for(Integer outerValue = 0; outerValue <= 0; outerValue++) {
            for(Integer innerValue = 0; innerValue <= 0; innerValue) {
                System.debug('Outer value = ' + outerValue + ' | Inner value = ' + innerValue);
            }
        }
    }
}
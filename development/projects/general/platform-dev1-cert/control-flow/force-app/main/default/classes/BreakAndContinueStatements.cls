/**
 * @description       : Understanding break and continue statements.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class BreakAndContinueStatements {

    public static void runBreakExample() {
        for(Integer numberVariable = 1; numberVariable <= 10; numberVariable++) {
            //If numberVariable has the value 5, the execution jumps out of the for loop.
            if(numbervariable == 5) {
                break;
            }

            System.debug('Value of number variable: ' + numberVariable);
        }
    }

    public static void runContinueExample() {
        for(Integer numberVariable = 1; numberVariable <= 10; numberVariable++) {
            //If numberVariable has the value 5, the execution skips this number and prints the numbers ahead.
            if(numbervariable == 5) {
                continue;
            }

            System.debug('Value of number variable: ' + numberVariable);
        }
    }
}
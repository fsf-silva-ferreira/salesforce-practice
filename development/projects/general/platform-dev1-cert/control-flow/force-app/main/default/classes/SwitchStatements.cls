/**
 * @description       : Working with switch statement.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SwitchStatements {
    
    public static void displayNumber(Integer inputNumber) {
        switch on inputNumber {
            when  2 {
                System.debug('Number is 2');
            }
            when -3 {
                System.debug('Number is -3');   
            }
            when else {
                System.debug('Number is neither 2 or -3');
            }
        }
    }

    public static void checkScore(Integer yourCcore) {
        switch on yourCcore {
            when  85,90,95,100 {
                System.debug('FIRST PLACE');
            }
            when 80,75 {
                System.debug('SECOND PLACE'); 
            } 
            when 70,65,60 {
                System.debug('THIRD PLACE'); 
            }
            when else {
                System.debug('WORK HARD ... NEXT TIME');
            }
        }
    }
}
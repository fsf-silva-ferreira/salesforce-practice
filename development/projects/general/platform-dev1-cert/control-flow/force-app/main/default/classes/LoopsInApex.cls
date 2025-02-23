/**
 * @description       : Studying loops in Apex: While, For and Do-While.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class LoopsInApex {
    
    public static void printStringTenTimes() {
        Integer counter = 1;

        while (counter <= 10) {
            System.debug('Deepika Khanna');
            counter++;
        }
    }

    public static void printIntegerHundredTimes() {
        Integer counter = 1;

        while (counter <= 100) {
            System.debug('Value of counter = ' + counter);
            counter++;
        }
    }

    public static void printIntegerTenOutOfTen() {
        Integer counter = 10;

        while (counter <= 100) {
            System.debug('Value of counter = ' + counter);
            counter += 10;
        }
    }

    public static void runIncrementingForLoop() {
        for(Integer counter = 1; counter <= 5; counter++) {
            System.debug('Value of counter = ' + counter);    
        }
    }

    public static void runDecrementingForLoop() {
        for(Integer counter = 10; counter >=1; counter--) {
            System.debug('Value of counter = ' + counter);    
        }
    }

    public static void runDecrementingForLoopByTwo() {
        for(Integer counter = 10; counter >= 0; counter = counter - 2) {
            System.debug('Value of counter = ' + counter);    
        }
    }
}
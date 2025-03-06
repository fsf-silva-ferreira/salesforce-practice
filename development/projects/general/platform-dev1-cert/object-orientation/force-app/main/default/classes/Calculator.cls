/**
 * @description       : Practicing method overloading.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_defining.htm
**/
public with sharing class Calculator {
    
    public Integer add(Integer numberA, Integer numberB) {
        return numberA + numberB;
    }

    public Integer multiply(Integer numberA, Integer numberB) {
        return numberA * numberB;
    }

    public Integer subtract(Integer numberA, Integer numberB) {
        if(numberA >= numberB) {
            return numberA - numberB;
        } else {
            return numberB - numberA;    
        }
    }

    public Integer divide(Integer numberA, Integer numberB) {
        if(numberA >= numberB) {
            return numberA / numberB;
        } else {
            return numberB / numberA;
        }
    }
}
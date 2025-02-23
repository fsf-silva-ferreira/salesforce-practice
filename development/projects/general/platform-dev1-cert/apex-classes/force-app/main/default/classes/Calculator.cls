/**
 * @description       : Practicing method overloading.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
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
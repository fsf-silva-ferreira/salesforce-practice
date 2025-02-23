/**
 * @description       : Practicing method overloading.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class MethodOverloading {
    
    //* Method overloading is methods with the same name but different number or type of parameters.
    //* The type of method return does't matter.
    public Integer add(Integer numberA, Integer numberB) {
        return numberA + numberB;
    }

    public void add(String numberA, Integer numberB) {
        System.debug('Different addition method');
    }

    public Integer add(Integer numberA, Integer numberB, Integer numberC) {
        return numberA + numberB + numberC;
    }
}
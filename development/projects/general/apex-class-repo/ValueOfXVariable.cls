/**
 * @description       : Find out the value of variable named X.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-02-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ValueOfXVariable {
    
    public static String getXvalue() {
        String x = 'A';
        Integer i = 10;

        if(i<15) {
            i = 15;
            x = 'B';
        } else 
        if (i < 20){
            x = 'C';
        } else {
            x = 'D';
        }

        return x;
    }
}
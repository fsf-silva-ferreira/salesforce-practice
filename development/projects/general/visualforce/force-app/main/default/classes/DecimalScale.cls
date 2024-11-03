/**
 * @description       : setScale method example.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-02-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DecimalScale {
    
    public static void getScaleExample(Decimal decimalNumber, Integer scale) {        
        //* Returns the Decimal scaled to the specified number of decimal places
        System.debug('Decimal value with scale: ' + decimalNumber.setScale(scale));
    }
}
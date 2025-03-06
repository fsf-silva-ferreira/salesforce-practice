/**
 * @description       : Working with unit tests.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class TemperatureConvertor {
    
    public static Decimal convertFahrenheitToCelsius(Decimal fahrenheitValue) {
        Decimal celsiusValue = (fahrenheitValue-32) * 5/9;
        celsiusValue = celsiusValue.setScale(2);
        System.debug('Temperature in Celsius: ' + celsiusValue);

        return celsiusValue;
    }
}
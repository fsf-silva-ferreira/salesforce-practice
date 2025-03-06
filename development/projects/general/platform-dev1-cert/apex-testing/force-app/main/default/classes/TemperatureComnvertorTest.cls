/**
 * @description       : Unit test class for TemperatureConvertor class.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_unit_tests.htm
**/
@isTest
private class TemperatureComnvertorTest {

    //* One test scenario = One test method
    @isTest
    static void testWarmTemperature() {
        Decimal celsiusResult = TemperatureConvertor.convertFahrenheitToCelsius(70);
        System.assertEquals(21.11, celsiusResult);
    }

    @isTest
    static void testFreezingPoint() {
        Decimal celsiusResult = TemperatureConvertor.convertFahrenheitToCelsius(32);
        System.assertEquals(0, celsiusResult);
    }

    @isTest
    static void testBoilingPoint() {
        Decimal celsiusResult = TemperatureConvertor.convertFahrenheitToCelsius(212);
        System.assertEquals(100, celsiusResult, 'Boiling point is not expected');
    }

    @isTest
    static void testnegativeTemperature() {
        Decimal celsiusResult = TemperatureConvertor.convertFahrenheitToCelsius(-10);
        System.assertEquals(-23.33, celsiusResult);
    }
}
/**
 * @description       : Date and time data types.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-22-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Sources:
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_date.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_datetime.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_time.htm
**/
public with sharing class DateTimeDataTypes {
    
    //*Properties
    private Integer numberOne = 100;
    Integer numberTwo = 89;

    Long longNumber = 2147483648L;

    Decimal decimalNumber = 19.23;

    Double doubleNumber = 3.14159;

    Boolean isActive = true;

    Date aDateVariable = Date.valueOf('2012-03-28');
    Date aDateVariable2 = Date.newInstance(2012, 5, 28);
    Date todayDate = Date.today();
    Date newDate = todayDate.addDays(2);

    Datetime dateTimeSample;

    //(hour, minutes, seconds, milliseconds)
    Time myTime = Time.newInstance(1, 2, 3, 0);


    //*Methods
    public void runDateMethods() {
        System.debug('Date 1: ' + aDateVariable);
        System.debug('Date 2: ' + aDateVariable2);
        System.debug('Days between: ' + aDateVariable.daysBetween(aDateVariable2));

        Datetime myDatetime1 = Datetime.newInstance(2025, 2, 22, 7, 47, 0);
        System.debug('myDatetime1: ' + myDatetime1);

        Datetime myDatetime2 = myDatetime1.addHours(2);
        System.debug('myDatetime1 + 2 hours: ' + myDatetime2);

        Datetime myDatetime3 = myDatetime1.addDays(4);
        System.debug('myDatetime1 + 4 days: ' + myDatetime3);

        Datetime myDatetime4 = myDatetime1.addMonths(5);
        System.debug('myDatetime1 + 5 months: ' + myDatetime4);

        Datetime myDatetime5 = myDatetime1.addYears(2);
        System.debug('myDatetime1 + 2 years: ' + myDatetime5);
    }

    public void runDateTime() {
        Date myDate = Date.newInstance(2011, 11, 18);
        Time myTime = Time.newInstance(3, 3, 3, 0);        
        dateTimeSample = DateTime.newInstance(myDate, myTime);
        //UTC (Coordinated Universal Time) is assumed
        System.debug('DateTime Sample: ' + dateTimeSample);

        Datetime newDatetime = Datetime.newInstance(2019,4,14,5,10,15);
        System.debug('New Datetime value: ' + newDatetime);

        String formattedDatetime = newDatetime.format();
        System.debug('Formatted Datetime: ' + formattedDatetime);
    }

    public void checkLeapYear(Integer year) {
        if(Date.isLeapYear(year)) {
            System.debug(year + ' is a leap year');
        } else {
            System.debug(year + ' is NOT a leap year');
        }
    }

    public void runTimeMethods() {
        Time myTime = Time.newInstance(6, 12, 4, 40);
        System.debug('Time is: ' + myTime);

        Time myTimePlus4Hours = myTime.addHours(4);
        System.debug('myTime + 4 hours: ' + myTimePlus4Hours);

        Time myTimePlus20Minutes = myTime.addMinutes(20);
        System.debug('myTime + 20 minutes: ' + myTimePlus20Minutes);

        Time myTimePlus30miliseconds = myTime.addMilliseconds(30);
        System.debug('myTime + 30 miliseconds: ' + myTimePlus30miliseconds);
    }
}
/**
 * @description       : Using String methods.
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-22-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Source:
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_string.htm
**/
public with sharing class StringDataTypeUsage {
    
    public static void runStringMethods() {
        String deepkaString = 'deepka khanna';
        Integer indexOfNn = deepkaString.indexOf('nn');
        System.debug('index of nn: ' + indexOfNn);
        System.debug('index of p: ' + deepkaString.indexOf('p'));
        System.debug('index of x: ' + deepkaString.indexOf('x'));

        String stringCapitalized = deepkaString.capitalize();
        System.debug('String capitalized: ' + stringCapitalized);

        String abcdeString = 'abcde';
        String fghijString = 'fghij';
        Integer comparisonResult1 = abcdeString.compareTo(fghijString);
        System.debug('Comparison result 1: ' + comparisonResult1);
        Integer comparisonResult2 = fghijString.compareTo(abcdeString);
        System.debug('Comparison result 2: ' + comparisonResult2);

        String fghijString2 = 'fghij';
        Integer comparisonResult3 = fghijString.compareTo(fghijString2);
        System.debug('Comparison result 3: ' + comparisonResult3);

        String stringMytutorialRack = 'MytutorialRack';
        String mytutorialrack = 'mytutorialRack';
        Boolean comparisonResult4 = stringMytutorialRack.equals(mytutorialrack);
        System.debug('Is \'MytutorialRack\' == \'mytutorialRack\'? ' + comparisonResult4);

        Boolean comparisonResult5 = stringMytutorialRack.equalsIgnoreCase(mytutorialrack);
        System.debug('Is \'MytutorialRack\' == \'mytutorialRack\' ignore case? ' + comparisonResult5);
        
        String firstNameDeepka = 'deepika';
        System.debug('\'deepka\' in upper case: ' + firstNameDeepka.toUpperCase());
        String lastNameKhanna = 'khanna';
        System.debug('Concatenating \'deepka\' and \'khanna\': ' + (firstNameDeepka + ' ' + lastNameKhanna));

        String howAreYou = 'HOW ARE YOU';
        System.debug('\'HOW ARE YOU\' in lower case: ' + howAreYou.toLowerCase());

        Boolean isPartOfDeepka = firstNameDeepka.contains('ika');
        System.debug('\'' + firstNameDeepka + '\' contains \'ika\'? ' + isPartOfDeepka);
    }
}
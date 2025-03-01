/**
 * @description       : Practicing lists.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ListExample {
    
    public static void displayListOfStudentNames() {
        //List are ordered and allow duplicates.
        List<String> studentNames = new List<String>();
        studentNames.add('Ravi');
        studentNames.add('John');
        studentNames.add('Adam');
        studentNames.add('Tina');
        studentNames.add('Adam');

        System.debug('Size of the list: ' + studentNames.size());
        System.debug('Elements in the list: ' + studentNames);
    }

    public static void runMoreAboutLists() {
        String[] listOfStrings = new List<String>{'One', 'Three', 'Two', 'Four'};
        System.debug('List has following items: ' + listOfStrings);
        System.debug('Size of the list: ' + listOfStrings.size());
        listOfStrings.add('Eleven');
        System.debug('Final size of the list: ' + listOfStrings.size());
        System.debug('List has new item: ' + listOfStrings);
        System.debug('Element at index 1: ' + listOfStrings[1]);
        System.debug('Element at index 1: ' + listOfStrings.get(1));
    }

    public static void runIncompatibleTypeOfException() {
        List<Integer> listOfIntegers = new List<Integer>();
        listOfIntegers.add(1);
        listOfIntegers.add(100);
        listOfIntegers.add(59);
        listOfIntegers.add(101988);
        //Lis below will cause this error: Method does not exist or incorrect signature: void add(String) from the type List<Integer>
        //listOfIntegers.add('10');

        System.debug('My list has: ' + listOfIntegers);
    }
}
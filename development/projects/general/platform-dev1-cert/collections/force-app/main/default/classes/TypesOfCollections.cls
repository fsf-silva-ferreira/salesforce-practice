/**
 * @description       : Using collections.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-21-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class TypesOfCollections {

    public TypesOfCollections() {
        /*
            A list is a collection of elements, such as Integers, Strings, objects, or other collections.
            Use a list when the sequence of elements is important. 
            You can have duplicate elements in a list.
            The first index position in a list is always 0.
        */
        List<Integer> myList = new List<Integer>();

        /*
            A set is a collection of unique, unordered elements. 
            It can contain primitive data types, such as String, Integer, Date, and so on. 
            It can also contain more complex data types, such as sObjects.
        */
        Set<String> myString = new Set<String>{'a', 'b', 'c'};

        /*
            A map is a collection of key-value pairs. 
            Keys can be any primitive data type. 
            Values can include primitive data types, as well as objects and other collections. 
            Use a map when finding something by key matters. Y
            ou can have duplicate values in a map, but each key must be unique.
        */
        Map<Integer, String> myMap = new Map<Integer, String>{1 => 'a', 2 => 'b', 3 => 'c'};
    }
}
/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-31-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DuplicateMapKey {
    
    public static void runExample() {
        AnObject firstObject = new AnObject(1, 'First object');
        AnObject lastObject = new AnObject(1, 'Last object');

        system.debug('First object: ' + firstObject);
        system.debug('Last object: ' + lastObject);

        List<AnObject> objects = new List<AnObject>();
        objects.add(firstObject);
        objects.add(lastObject);

        system.debug('Object list: ' + objects);

        Map<Integer, String> aMap = new Map<Integer, String>();
        for (AnObject anObject : objects) {
            aMap.put(anObject.id, anObject.name);
        }

        system.debug('aMap content: ' + aMap);
    }
}
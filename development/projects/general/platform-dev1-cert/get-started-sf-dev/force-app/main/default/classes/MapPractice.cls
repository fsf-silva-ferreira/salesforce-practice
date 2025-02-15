/**
 * @description       : Interesting finding regarding Apex maps.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-27-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Reference: https://www.youtube.com/watch?v=UP1q5xk7PBI
**/
public with sharing class MapPractice {
    
    public static void runInterestingFindingAboutMaps() {        
        Contact contact1 = new Contact();
        contact1.LastName = 'Test1';
        Contact contact2 = new Contact();
        contact2.LastName = 'Test2';

        Map<Contact, Integer> mapOfContacts = new Map<Contact, Integer>();
        mapOfContacts.put(contact1.clone(), 1);
        mapOfContacts.put(contact2.clone(), 2);

        System.debug('Before DML: ' + mapOfContacts);

        List<Contact> contactList = new List<Contact>();
        //map contacts are still in dormant state
        contactList.addAll(mapOfContacts.keySet());
        upsert contactList;

        System.debug('After DML: ' + mapOfContacts);
    }
}

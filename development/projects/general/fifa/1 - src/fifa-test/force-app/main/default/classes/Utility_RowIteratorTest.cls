/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-09-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public with sharing class Utility_RowIteratorTest {
    
    @isTest static void testUtilityRowIterator() {
        String csv = '"FirstName", "LastName"\n"TestName1", "Test1"\n"TestName2", "Test2"';
        List<String> names = new List<String>();
        Utility_RowIterator rowIterator = new Utility_RowIterator(csv, '\n');
        Iterator<String> iterator = rowIterator.iterator();
        while (iterator.hasNext()) {
            names.add(iterator.next());
        }
        System.assertEquals('"TestName1", "Test1"', names[1]);
    }
}
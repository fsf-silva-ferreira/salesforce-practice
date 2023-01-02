/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-02-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class FootballAssociationLinksManagerTest {
    
    @IsTest
    public static void testGetLinks() {
        List<String> footballAssociationLinks = new List<String>();
        footballAssociationLinks = FootballAssociationLinksManager.getLinks();

        System.assertEquals(15, footballAssociationLinks.size());
    }
}

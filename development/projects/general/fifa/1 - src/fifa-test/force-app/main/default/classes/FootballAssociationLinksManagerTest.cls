/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-08-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class FootballAssociationLinksManagerTest {
    
    @IsTest
    public static void testGetLinks() {
        List<String> cafLinks = FootballAssociationLinksManager.getAfricanFootballLinks();
        List<String> afcLinks = FootballAssociationLinksManager.getAsianFootballLinks();
        List<String> concacafLinks = FootballAssociationLinksManager.getConcacafLinks();
        List<String> conmebolLinks = FootballAssociationLinksManager.getConmebolLinks();
        List<String> ofcLinks = FootballAssociationLinksManager.getOfcLinks();
        List<String> uefaLinks = FootballAssociationLinksManager.getUefaLinks();

        System.assertEquals(26, cafLinks.size());
        System.assertEquals(28, afcLinks.size());
        System.assertEquals(9, concacafLinks.size());
        System.assertEquals(10, conmebolLinks.size());
        System.assertEquals(3, ofcLinks.size());
        System.assertEquals(34, uefaLinks.size());
    }
}

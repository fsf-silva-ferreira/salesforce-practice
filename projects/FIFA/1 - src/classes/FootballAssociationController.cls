/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-09-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationController {

    private static List<Football_Association__c> footballAssociations = new List<Football_Association__c>();
    private static Set<Football_Association__c> footballAssociationsNoDuplicates = new Set<Football_Association__c>();
    private static List<String> footballAssociationHtmlPage;
    private static Football_Association__c footballAssociation;

    public static void runWebToBaseConcacafConmebolUefa() {
        System.debug('************************ ||PROCESS START - CONCACAF, CONMEBOL, UEFA|| ************************');

        System.debug('||--> STEP 1: GET WIKIPEDIA URLS');        
        List<String> concacafUrls = FootballAssociationLinksManager.getConcacafLinks();
        List<String> conmebolUrls = FootballAssociationLinksManager.getConmebolLinks();
        List<String> uefaUrls = FootballAssociationLinksManager.getUefaLinks();
        System.debug('||--> STEP 1 DONE!');

        System.debug('||--> STEP 2: CONVERT URLS INTO Football_Association__c OBJECT');       
        convertUrlsToFootAssociationList(concacafUrls);
        convertUrlsToFootAssociationList(conmebolUrls);
        convertUrlsToFootAssociationList(uefaUrls);
        System.debug('||--> STEP 2 DONE!');

        System.debug('||--> STEP 3: INSERT Football_Association__c OBJECTS INTO DATABASE');
        String errorMessages = insertFootballAssociations();
        System.debug('||--> STEP 3 DONE!');

        System.debug('||--> STEP 4: NOTIFY ADMINS IN CASE OF DATABASE ERROR');
        if(errorMessages != '') {
            sendErrorNotificationToAdmins(errorMessages);
            System.debug('||--> STEP 4 DONE!');
        } else {
            System.debug('NO DATABASE ERROR FOUND');    
        }
        
        System.debug('************************ ||PROCESS END - CONCACAF, CONMEBOL, UEFA|| ************************');
    }

    public static void runWebToBaseCafAfcOfc() {
        System.debug('************************ ||PROCESS START - CAF, AFC, OFC|| ************************');

        System.debug('||--> STEP 1: GET WIKIPEDIA URL LINKS');
        List<String> uefaUrls = FootballAssociationLinksManager.getUefaLinks();
        List<String> concacafUrls = FootballAssociationLinksManager.getConcacafLinks();
        List<String> conmebolUrls = FootballAssociationLinksManager.getConmebolLinks();
        List<String> afcUrls = FootballAssociationLinksManager.getAsianFootballLinks();
        List<String> cafUrls = FootballAssociationLinksManager.getAfricanFootballLinks();
        List<String> ofcUrls = FootballAssociationLinksManager.getOfcLinks();
        System.debug('||--> STEP 1 DONE!');

        System.debug('||--> STEP 2: CONVERT URLS INTO Football_Association__c OBJECT');
        convertUrlsToFootAssociationList(cafUrls);
        convertUrlsToFootAssociationList(afcUrls);        
        convertUrlsToFootAssociationList(ofcUrls);
        System.debug('||--> STEP 2 DONE!');

        System.debug('||--> STEP 3: INSERT Football_Association__c OBJECTS INTO DATABASE');
        String errorMessages = insertFootballAssociations();
        System.debug('||--> STEP 3 DONE!');

        System.debug('||--> STEP 4: NOTIFY ADMINS IN CASE OF DATABASE ERROR');
        if(errorMessages != '') {
            sendErrorNotificationToAdmins(errorMessages);
            System.debug('||--> STEP 4 DONE!');
        } else {
            System.debug('NO DATABASE ERROR FOUND');    
        }
        
        System.debug('************************ ||PROCESS END - CAF, AFC, OFC|| ************************');
    }

    private static void convertUrlsToFootAssociationList(List<String> footballAssociationUrls) {
        for (String footballAssociationUrl : footballAssociationUrls) {
            System.debug('      ||--> URL: ' + footballAssociationUrl);
            footballAssociationHtmlPage = WebPageHtmlCallout.getCalloutResponseContents(footballAssociationUrl);
            footballAssociation = FootballAssociationObjectHandler.getFootballAssociationObject(footballAssociationHtmlPage);
            System.debug('      ||--> OBJECT: ' + footballAssociation);

            footballAssociationsNoDuplicates.add(footballAssociation);
        }    
    } 

    private static String insertFootballAssociations() {
        footballAssociations.addAll(footballAssociationsNoDuplicates);
        Database.SaveResult[] saveResults = Database.insert(footballAssociations, false);
        String errorMessages = DatabaseErrorManager.handleSaveResults(saveResults);

        return errorMessages;
    }

    private static void sendErrorNotificationToAdmins(String errorMessages) {
        MailSender.sendErrorMessagesToAdmins(errorMessages);
        Notification.notifyErrorsToAdmins('Fifa App - Error Notification', errorMessages);
    }
}
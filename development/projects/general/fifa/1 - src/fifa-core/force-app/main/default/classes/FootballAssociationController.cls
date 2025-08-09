/**
 * @description       : Football Association web-to-base process.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 08-09-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * External link:
 * https://trailhead.salesforce.com/pt-BR/trailblazer-community/feed/0D54V00007T453fSAB
**/
public with sharing class FootballAssociationController {

    private static List<Football_Association__c> footballAssociations = new List<Football_Association__c>();
    private static Set<Football_Association__c> footballAssociationsNoDuplicates = new Set<Football_Association__c>();
    private static List<String> footballAssociationHtmlPage;
    private static Football_Association__c footballAssociation;

    @future(callout=true)
    public static void runWebToBaseConcacaf() {
        System.debug('************************ ||PROCESS START - CONCACAF|| ************************');

        System.debug('||--> STEP 1: GET WIKIPEDIA URLS');        
        List<String> concacafUrls = FootballAssociationLinksManager.getConcacafLinks();
        System.debug('||--> STEP 1 DONE!');

        System.debug('||--> STEP 2: CONVERT URLS INTO Football_Association__c OBJECT');       
        convertUrlsToFootAssociationList(concacafUrls);
        System.debug('||--> STEP 2 DONE!');

        System.debug('||--> STEP 3: INSERT Football_Association__c OBJECTS INTO DATABASE');
        String errorMessages = upsertFootballAssociations();
        System.debug('||--> STEP 3 DONE!');

        System.debug('||--> STEP 4: NOTIFY ADMINS IN CASE OF DATABASE ERROR');
        if(errorMessages != '') {
            sendErrorNotificationToAdmins(errorMessages);
            System.debug('||--> STEP 4 DONE!');
        } else {
            System.debug('NO DATABASE ERROR FOUND');    
        }

        System.debug('************************ ||PROCESS END - CONCACAF|| ************************');
    }

     @future(callout=true)
    public static void runWebToBaseConmebol() {
        System.debug('************************ ||PROCESS START - CONMEBOL|| ************************');

        System.debug('||--> STEP 1: GET WIKIPEDIA URLS');                
        List<String> conmebolUrls = FootballAssociationLinksManager.getConmebolLinks();        
        System.debug('||--> STEP 1 DONE!');

        System.debug('||--> STEP 2: CONVERT URLS INTO Football_Association__c OBJECT');       
        convertUrlsToFootAssociationList(conmebolUrls);
        System.debug('||--> STEP 2 DONE!');

        System.debug('||--> STEP 3: INSERT Football_Association__c OBJECTS INTO DATABASE');
        String errorMessages = upsertFootballAssociations();
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

    @future(callout=true)
    public static void runWebToBaseUefa() {
        System.debug('************************ ||PROCESS START - UEFA|| ************************');

        System.debug('||--> STEP 1: GET WIKIPEDIA URLS');        
        List<String> uefaUrls = FootballAssociationLinksManager.getUefaLinks();
        System.debug('||--> STEP 1 DONE!');

        System.debug('||--> STEP 2: CONVERT URLS INTO Football_Association__c OBJECT');       
        convertUrlsToFootAssociationList(uefaUrls);
        System.debug('||--> STEP 2 DONE!');

        System.debug('||--> STEP 3: INSERT Football_Association__c OBJECTS INTO DATABASE');
        String errorMessages = upsertFootballAssociations();
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

    @future(callout=true)
    public static void runWebToBaseCaf() {
        System.debug('************************ ||PROCESS START - CAF|| ************************');

        System.debug('||--> STEP 1: GET WIKIPEDIA URL LINKS');
        List<String> cafUrls = FootballAssociationLinksManager.getAfricanFootballLinks();
        System.debug('||--> STEP 1 DONE!');

        System.debug('||--> STEP 2: CONVERT URLS INTO Football_Association__c OBJECT');
        convertUrlsToFootAssociationList(cafUrls);
        System.debug('||--> STEP 2 DONE!');

        System.debug('||--> STEP 3: INSERT Football_Association__c OBJECTS INTO DATABASE');
        String errorMessages = upsertFootballAssociations();
        System.debug('||--> STEP 3 DONE!');

        System.debug('||--> STEP 4: NOTIFY ADMINS IN CASE OF DATABASE ERROR');
        if(errorMessages != '') {
            sendErrorNotificationToAdmins(errorMessages);
            System.debug('||--> STEP 4 DONE!');
        } else {
            System.debug('NO DATABASE ERROR FOUND');    
        }
        
        System.debug('************************ ||PROCESS END - CAF|| ************************');
    }

    @future(callout=true)
    public static void runWebToBaseAfc() {
        System.debug('************************ ||PROCESS START - AFC|| ************************');

        System.debug('||--> STEP 1: GET WIKIPEDIA URL LINKS');
        List<String> afcUrls = FootballAssociationLinksManager.getAsianFootballLinks();
        System.debug('||--> STEP 1 DONE!');

        System.debug('||--> STEP 2: CONVERT URLS INTO Football_Association__c OBJECT');        
        convertUrlsToFootAssociationList(afcUrls);                
        System.debug('||--> STEP 2 DONE!');

        System.debug('||--> STEP 3: INSERT Football_Association__c OBJECTS INTO DATABASE');
        String errorMessages = upsertFootballAssociations();
        System.debug('||--> STEP 3 DONE!');

        System.debug('||--> STEP 4: NOTIFY ADMINS IN CASE OF DATABASE ERROR');
        if(errorMessages != '') {
            sendErrorNotificationToAdmins(errorMessages);
            System.debug('||--> STEP 4 DONE!');
        } else {
            System.debug('NO DATABASE ERROR FOUND');    
        }

        System.debug('************************ ||PROCESS END - AFC|| ************************');

    }

    @future(callout=true)
    public static void runWebToBaseOfc() {
        System.debug('************************ ||PROCESS START - OFC|| ************************');

        System.debug('||--> STEP 1: GET WIKIPEDIA URL LINKS');
        List<String> ofcUrls = FootballAssociationLinksManager.getOfcLinks();
        System.debug('||--> STEP 1 DONE!');

        System.debug('||--> STEP 2: CONVERT URLS INTO Football_Association__c OBJECT');       
        convertUrlsToFootAssociationList(ofcUrls);
        System.debug('||--> STEP 2 DONE!');

        System.debug('||--> STEP 3: INSERT Football_Association__c OBJECTS INTO DATABASE');
        String errorMessages = upsertFootballAssociations();
        System.debug('||--> STEP 3 DONE!');

        System.debug('||--> STEP 4: NOTIFY ADMINS IN CASE OF DATABASE ERROR');
        if(errorMessages != '') {
            sendErrorNotificationToAdmins(errorMessages);
            System.debug('||--> STEP 4 DONE!');
        } else {
            System.debug('NO DATABASE ERROR FOUND');    
        }

        System.debug('************************ ||PROCESS END - OFC|| ************************');

    }

    private static void convertUrlsToFootAssociationList(List<String> footballAssociationUrls) {
        if (Test.isRunningTest()) {
            WebPageHtmlCallout.mock = new ExampleCalloutMock(200);
            WebPageHtmlCallout.getCalloutResponseContents('http://www.test.com');
        } else {
            for (String footballAssociationUrl : footballAssociationUrls) {
                System.debug('      ||--> URL: ' + footballAssociationUrl);
                footballAssociationHtmlPage = WebPageHtmlCallout.getCalloutResponseContents(footballAssociationUrl);
                footballAssociation = FootballAssociationObjectHandler.getFootballAssociationObject(footballAssociationHtmlPage);
                System.debug('      ||--> OBJECT: ' + footballAssociation);

                footballAssociationsNoDuplicates.add(footballAssociation);
            }  
        }  
    } 

    private static String upsertFootballAssociations() {
        footballAssociations.addAll(footballAssociationsNoDuplicates);
        Database.UpsertResult[] upsertResults = Database.upsert(footballAssociations, Football_Association__c.External_ID__c, false);
        String errorMessages = DatabaseErrorManager.handleUpsertResults(upsertResults);

        return errorMessages;
    }

    private static void sendErrorNotificationToAdmins(String errorMessages) {
        //MailSender.sendErrorMessagesToAdmins(errorMessages);
        Notification.notifyErrorsToAdmins('Fifa App - Error Notification', errorMessages);
    }
}
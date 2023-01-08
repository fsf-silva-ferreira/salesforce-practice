/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-07-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class HtmlHandlingUtility {

    private String htmlLineFound;

    public String searchHtmlLine(List<String> htmlPageLines, String htmlKey) {
        System.debug('[searchHtmlLine] htmlKey: ' + htmlKey);

        for(String htmlLine : htmlPageLines) {
            if(htmlLine.contains(htmlKey)) {
                htmlLineFound = htmlLine;
                break;
            }    
        }  
        
        System.debug('[searchHtmlLine] htmlLineFound: ' + htmlLineFound);

        return htmlLineFound;
    }

    public String searchHtmlLineBelow(List<String> htmlPageLines, String htmlKey) {
        System.debug('[searchHtmlLineBelow] htmlKey: ' + htmlKey);

        for(Integer i=0; i<htmlPageLines.size(); i++) {
            String htmlLine = htmlPageLines.get(i);

            if(htmlLine.contains(htmlKey)) {
                htmlLineFound = htmlPageLines.get(i+1);

                System.debug('[searchHtmlLineBelow] htmlLineFound: ' + htmlLineFound);

                break;
            }    
        }  
        
        return htmlLineFound;
    }

    public String cleanTrashFromYear(String yearToClean) {
        yearToClean = yearToClean.replace(' (1945 as NFA)', '').replace('May&#160;', '').replace(' (associate member)', '');

        List<String> yearToCleanArray1 = yearToClean.split('<');
        System.debug('yearToClean: ' + yearToClean);
        System.debug('yearToCleanArray1: ' + yearToCleanArray1);
        List<String> yearToCleanArray2 = yearToCleanArray1[0].split(' ');
        
        System.debug('yearToCleanArray2: ' + yearToCleanArray2);
        return yearToCleanArray2[yearToCleanArray2.size()-1];
    }
}

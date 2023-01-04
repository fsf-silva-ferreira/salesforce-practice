/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-03-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationHtmlReader {

    private List<String> htmlPageLines = new List<String>();
    private String htmlLineFound;

    public FootballAssociationHtmlReader(List<String> htmlData) {
        htmlPageLines = htmlData;
    }

    public String getAcronymField() {
        String acronym;

        return acronym;
    }

    public String getFullNameField() {
        String fullName;        

        searchHtmlLine('<title>');

        if(htmlLineFound != null) {
            fullName = htmlLineFound.replace('<title>', '').replace(' - Wikipedia</title>', '').trim();
        }

        return fullName;
    }

    public Integer getYearFoundedField() {
        Integer yearFounded;

        searchHtmlLine('Founded</th><td class="infobox-data">');

        if(htmlLineFound != null) {
            System.debug('htmlLineFound: --> ' + htmlLineFound);

            List<String> htmlLineFound1 = htmlLineFound.split('Founded</th><td class="infobox-data">');

            System.debug('htmlLineFound1: --> ' + htmlLineFound1);

            /*
            htmlLineFound1[1] = htmlLineFound1[1].replace('8&#160;June ', '').replace('18 December ', '').replace('28&#160;January ', '')
                .replace('21&#160;February ', '').replace('19&#160;June ', '').replace('21 August ', '').replace('7&#160;April ', '');
            */

            htmlLineFound1[1] = cleanTrashFromYear(htmlLineFound1[1]);

            try {
                yearFounded = integer.valueof(htmlLineFound1[1].substring(0, 4));
            } catch (Exception e) {
                searchHtmlLineBelow('Founded');

                if(htmlLineFound != null) {
                    htmlLineFound = htmlLineFound.replace('<ul><li>', '');

                    System.debug('      HTML year founded line found: --> ' + htmlLineFound);  

                    try {
                        yearFounded = integer.valueof(htmlLineFound.substring(0, 4));
                    } catch (Exception eLineBelow) {
                        System.debug('Exception: ' + e.getMessage());
                        yearFounded = null;
                    }
                } else {
                    yearFounded = null;
                }
            }
        }

        return yearFounded;
    }

    public Integer getYearFifaAffiliationField() {
        Integer yearFifaAffiliation;

        searchHtmlLine('FIFA">FIFA</a> affiliation</span></th><td class="infobox-data">');

        if(htmlLineFound != null) {
            List<String> htmlLineFifaAffiliation1 = htmlLineFound.split('FIFA">FIFA</a> affiliation</span></th><td class="infobox-data">');            
            List<String> htmlLineFifaAffiliation2 = htmlLineFifaAffiliation1[1].split('<'); 

            //htmlLineFifaAffiliation2[0] = htmlLineFifaAffiliation2[0].replace('21 May ', '').replace('1&#160;July ', '');

            htmlLineFifaAffiliation2[0] = cleanTrashFromYear(htmlLineFifaAffiliation2[0]);

            System.debug('      HTML FIFA affiliation line found: --> ' + htmlLineFifaAffiliation2[0]);

            try {
                yearFifaAffiliation = integer.valueof(htmlLineFifaAffiliation2[0]);
            } catch (Exception e) {
                System.debug('Exception: ' + e.getMessage());
                yearFifaAffiliation = null;
            }
        }

        return yearFifaAffiliation;
    }

    public Integer getYearContinentalAffiliationField() {
        Integer yearContinentalAffiliation;
        List<String> continentalConfederations = new List<String>{'CONCACAF', 'CONMEBOL', 'UEFA', 'CAF', 'AFC', 'OFC'};

        for(String continentalConfederation : continentalConfederations) {
            yearContinentalAffiliation = searchYearContinentalAffiliation(continentalConfederation);    

            if(yearContinentalAffiliation != null) {
                break;
            }
        }

        return yearContinentalAffiliation;
    }

    public String getPresidentField() {
        String president;
        
        searchHtmlLine('</td></tr><tr><th scope="row" class="infobox-label">President');

        if(htmlLineFound != null) {
            List<String> htmlLinePresident1 = htmlLineFound.split('</td></tr><tr><th scope="row" class="infobox-label">President</th><td class="infobox-data">');

            List<String> htmlLinePresident2 = null;
            List<String> htmlLinePresident3 = null;
            List<String> htmlLinePresident4 = null;            

            if(htmlLinePresident1[1].contains('<sup')) {
                htmlLinePresident2 = htmlLinePresident1[1].split('<sup');

                if(htmlLinePresident2[0].contains('">')) {
                    htmlLinePresident3 =  htmlLinePresident2[0].split('">') ; 
                    president = htmlLinePresident3[1];
                } else {
                    president = htmlLinePresident2[0];
                }
            } else
            if(htmlLinePresident1[1].contains('">')) { 
                htmlLinePresident2 = htmlLinePresident1[1].split('">');
                htmlLinePresident3 = htmlLinePresident2[0].split('</td>');

                if(htmlLinePresident3[0].contains('title="')) {
                    htmlLinePresident4 = htmlLinePresident3[0].split('title="');
                    president = htmlLinePresident4[1];
                } else {
                    president = htmlLinePresident3[0];
                }
            }

            president = president.replace('</a> (since 23 March 2022)','').replace('</a>', '').replace('&#39;', '\'').replace(' (referee)', '').
                replace('<sup id="cite_ref-JFA_President_2-0" class="reference', '').replace('<sup id="cite_ref-1" class="reference', '').
                replace('<sup id="cite_ref-afa2020_2-0" class="reference', '');
        }

        return president;
    }

    public String getWebsiteField() {
        String website;

        searchHtmlLine('<th scope="row" class="infobox-label">Website');

        if(htmlLineFound != null) {
            List<String> htmlLineWebsite1 = null;
            List<String> htmlLineWebsite2 = null;
            List<String> htmlLineWebsite3 = null;

            if(htmlLineFound.contains('external free')) {
                htmlLineWebsite1 = htmlLineFound.split('class="external free" href="');                
            } else
            if(htmlLineFound.contains('external text')) {
                htmlLineWebsite1 = htmlLineFound.split('class="external text" href="');     
            }

            htmlLineWebsite2 = htmlLineWebsite1[1].split('">');
            website = htmlLineWebsite2[0].replace('https://', '').replace('http://', '').replace('/eng', '').replace('/en/en-start/', '')
                .replace('/es/', '');

            if(website.endsWith('/')) {
                website = website.replace(website.substring(website.length()-1, website.length()), '');    
            }
        }

        return website;
    }

    private Integer searchYearContinentalAffiliation(String continentalConfederation) {
        Integer yearContinentalAffiliation;

        htmlLineFound = null; 
        for(String htmlLine : htmlPageLines) {
            if(htmlLine.contains(continentalConfederation + '</a> affiliation')) {
                htmlLineFound = htmlLine;
                break;
            }    
        }    

        if(htmlLineFound != null) {
            List<String> htmlLineFifaAffiliation1 = htmlLineFound.split(continentalConfederation + '</a> affiliation</span></th><td class="infobox-data">');
            List<String> htmlLineFifaAffiliation2 = htmlLineFifaAffiliation1[1].split('<'); 
            
            //htmlLineFifaAffiliation2[0] = htmlLineFifaAffiliation2[0].replace('9&#160;July ', '');

            htmlLineFifaAffiliation2[0] = cleanTrashFromYear(htmlLineFifaAffiliation2[0]);

            System.debug('      HTML year continental affiliation line found: --> ' + htmlLineFound);  

            try {
                yearContinentalAffiliation = integer.valueof(htmlLineFifaAffiliation2[0]);
            } catch (Exception e) {
                System.debug('Exception: ' + e.getMessage());
                yearContinentalAffiliation = null;
            }            
        }

        return yearContinentalAffiliation;
    }

    private void searchHtmlLine(String htmlKey) {
        System.debug('htmlKey: ' + htmlKey);

        for(String htmlLine : htmlPageLines) {
            if(htmlLine.contains(htmlKey)) {
                htmlLineFound = htmlLine;
                break;
            }    
        }  
        
        System.debug('htmlLineFound: ' + htmlLineFound);
    }

    private void searchHtmlLineBelow(String htmlKey) {
        for(Integer i=0; i<htmlPageLines.size(); i++) {
            String htmlLine = htmlPageLines.get(i);

            if(htmlLine.contains(htmlKey)) {
                htmlLineFound = htmlPageLines.get(i+1);
                break;
            }    
        }    
    }

    private String cleanTrashFromYear(String yearToClean) {
        yearToClean = yearToClean.replace(' (1945 as NFA)', '');

        List<String> yearToCleanArray1 = yearToClean.split('<');
        System.debug('yearToClean: ' + yearToClean);
        System.debug('yearToCleanArray1: ' + yearToCleanArray1);
        List<String> yearToCleanArray2 = yearToCleanArray1[0].split(' ');
        
        System.debug('yearToCleanArray2: ' + yearToCleanArray2);
        return yearToCleanArray2[yearToCleanArray2.size()-1];
        /*
        replace('8&#160;June ', '').replace('18 December ', '').replace('28&#160;January ', '')
                .replace('21&#160;February ', '').replace('19&#160;June ', '').replace('21 August ', '').replace('7&#160;April ', ''); 
        */
    }
}

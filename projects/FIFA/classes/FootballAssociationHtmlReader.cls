/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-30-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationHtmlReader {

    private List<String> htmlPageLines = new List<String>();
    private String htmlLineFounded;

    public FootballAssociationHtmlReader(List<String> htmlData) {
        htmlPageLines = htmlData;
    }

    public String getAcronymField() {
        String acronym;

        return acronym;
    }

    public String getFullNameField() {
        String fullName = null;        

        searchHtmlKey('<title>');

        if(htmlLineFounded != null) {
            fullName = htmlLineFounded.replace('<title>', '').replace(' - Wikipedia</title>', '').trim();
        }

        return fullName;
    }

    public Integer getYearFoundedField() {
        Integer yearFounded = null;

        searchHtmlKey('Founded');

        if(htmlLineFounded != null) {
            List<String> htmlLineFounded1 = htmlLineFounded.split('Founded</th><td class="infobox-data">');
            List<String> htmlLineFounded2 = htmlLineFounded1[1].split('<span class="noprint">'); 
            
            yearFounded = integer.valueof(htmlLineFounded2[0]);
        }

        return yearFounded;
    }

    public Integer getYearFifaAffiliationField() {
        Integer yearFifaAffiliation;

        searchHtmlKey('FIFA">FIFA</a> affiliation</span></th><td class="infobox-data">');

        if(htmlLineFounded != null) {
            List<String> htmlLineFifaAffiliation1 = htmlLineFounded.split('FIFA">FIFA</a> affiliation</span></th><td class="infobox-data">');
            List<String> htmlLineFifaAffiliation2 = htmlLineFifaAffiliation1[1].split('</td></tr><tr><th'); 
            
            yearFifaAffiliation = integer.valueof(htmlLineFifaAffiliation2[0]);
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
        
        searchHtmlKey('</td></tr><tr><th scope="row" class="infobox-label">President');

        if(htmlLineFounded != null) {
            List<String> htmlLinePresident1 = htmlLineFounded.split('</td></tr><tr><th scope="row" class="infobox-label">President</th><td class="infobox-data">');

            List<String> htmlLinePresident2 = null;
            List<String> htmlLinePresident3 = null;

            if(htmlLinePresident1[1].startsWith('<a href="/wiki/')) { 
                htmlLinePresident2 = htmlLinePresident1[1].split('">'); 
                htmlLinePresident3 = htmlLinePresident2[1].split('</td>');

                president = htmlLinePresident3[0].replace('</a> (since 23 March 2022)','').replace('</a>', '');
            } else { 
                htmlLinePresident2 = htmlLinePresident1[1].split('<');

                president = htmlLinePresident2[0].replace('</a>', '');
            }
        }

        return president;
    }

    public String getWebsiteField() {
        String website;

        searchHtmlKey('<th scope="row" class="infobox-label">Website');

        if(htmlLineFounded != null) {
            List<String> htmlLineWebsite1 = null;
            List<String> htmlLineWebsite2 = null;
            List<String> htmlLineWebsite3 = null;

            if(htmlLineFounded.contains('external free')) {
                htmlLineWebsite1 = htmlLineFounded.split('class="external free" href="');                
            } else
            if(htmlLineFounded.contains('external text')) {
                htmlLineWebsite1 = htmlLineFounded.split('class="external text" href="');     
            }

            htmlLineWebsite2 = htmlLineWebsite1[1].split('">');
            website = htmlLineWebsite2[0];
        }

        return website;
    }

    private void searchHtmlKey(String htmlKey) {
        for(String htmlLine : htmlPageLines) {
            if(htmlLine.contains(htmlKey)) {
                htmlLineFounded = htmlLine;
                break;
            }    
        }    
    }

    private Integer searchYearContinentalAffiliation(String continentalConfederation) {
        Integer yearContinentalAffiliation;

        for(String htmlLine : htmlPageLines) {
            if(htmlLine.contains(continentalConfederation + '</a> affiliation')) {
                htmlLineFounded = htmlLine;
                break;
            }    
        }    

        if(htmlLineFounded != null) {
            List<String> htmlLineFifaAffiliation1 = htmlLineFounded.split(continentalConfederation + '</a> affiliation</span></th><td class="infobox-data">');
            List<String> htmlLineFifaAffiliation2 = htmlLineFifaAffiliation1[1].split('<'); 
            
            yearContinentalAffiliation = integer.valueof(htmlLineFifaAffiliation2[0]);
        }

        return yearContinentalAffiliation;
    }
}

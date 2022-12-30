/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-29-2022
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

        searchContinentalAffiliation();
        
        if(htmlLineFounded != null) {
            List<String> htmlLineFifaAffiliation1 = htmlLineFounded.split('"CONCACAF">CONCACAF</a> affiliation</span></th><td class="infobox-data">');
            List<String> htmlLineFifaAffiliation2 = htmlLineFifaAffiliation1[1].split('<'); 
            
            yearContinentalAffiliation = integer.valueof(htmlLineFifaAffiliation2[0]);
        }

        return yearContinentalAffiliation;
    }

    public String getPresidentField() {
        String president;
        
        return president;
    }

    public String getWebsiteField() {
        String website;
        
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

    private void searchContinentalAffiliation() {
        for(String htmlLine : htmlPageLines) {
            if(htmlLine.contains('CONCACAF</a> affiliation')) {
                htmlLineFounded = htmlLine;
                break;
            }    
        }    
    }
}

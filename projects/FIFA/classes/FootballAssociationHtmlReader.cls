/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-28-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationHtmlReader {

    private List<String> htmlPageLines = new List<String>();

    public FootballAssociationHtmlReader(List<String> htmlData) {
        htmlPageLines = htmlData;
    }

    public String getAcronymField() {
        String acronym;

        return acronym;
    }

    public String getFullNameField() {
        String fullName;

        return fullName;
    }

    public Integer getYearFoundedField() {
        Integer yearFounded = null;
        String htmlLineFounded = null;

        for(String htmlLine : htmlPageLines) {
            if(htmlLine.contains('Founded')) {
                htmlLineFounded = htmlLine;
                break;
            }    
        }

        if(htmlLineFounded != null) {
            List<String> htmlLineFounded1 = htmlLineFounded.split('Founded</th><td class="infobox-data">');
            List<String> htmlLineFounded2 = htmlLineFounded1[1].split('<span class="noprint">'); 
            
            yearFounded = integer.valueof(htmlLineFounded2[0]);
        }

        return yearFounded;
    }

    public Integer getYearFifaAffiliationField() {
        Integer yearFifaAffiliation;

        return yearFifaAffiliation;
    }

    public Integer getYearContinentalAffiliationField() {
        Integer yearContinentalAffiliation;

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
}

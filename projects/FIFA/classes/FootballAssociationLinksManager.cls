/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-07-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationLinksManager {
   
    public static List<String> getLinks() {
        List<String> footballAssociationLinks = new List<String>();
   
        //footballAssociationLinks.addAll(getConmebolLinks());
        //footballAssociationLinks.addAll(getConcacafLinks());
        //footballAssociationLinks.addAll(getOfcLinks());
        //footballAssociationLinks.addAll(getAfricanFootballLinks());
        footballAssociationLinks.addAll(getAsianFootballLinks());
        //footballAssociationLinks.addAll(getUefaLinks());

        return footballAssociationLinks;
    }

    private static List<String> getConmebolLinks() {
        List<String> conmebolLinks = new List<String>();

        conmebolLinks.add('https://en.wikipedia.org/wiki/Ecuadorian_Football_Federation');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Peruvian_Football_Federation');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Bolivian_Football_Federation');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Uruguayan_Football_Association');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Paraguayan_Football_Association');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Colombian_Football_Federation');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Venezuelan_Football_Federation');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Chile');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Brazilian_Football_Confederation');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Argentine_Football_Association');

        return conmebolLinks;
    }

    private static List<String> getConcacafLinks() {
        List<String> concacafLinks = new List<String>();

        concacafLinks.add('https://en.wikipedia.org/wiki/National_Football_Federation_of_Guatemala');
        concacafLinks.add('https://en.wikipedia.org/wiki/Salvadoran_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/National_Autonomous_Federation_of_Football_of_Honduras');
        concacafLinks.add('https://en.wikipedia.org/wiki/Panamanian_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Belize');
        concacafLinks.add('https://en.wikipedia.org/wiki/Mexican_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Canadian_Soccer_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Jamaica_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/United_States_Soccer_Federation');

        return concacafLinks;
    }

    private static List<String> getOfcLinks() {
        List<String> ofcLinks = new List<String>();

        ofcLinks.add('https://en.wikipedia.org/wiki/New_Zealand_Football');
        ofcLinks.add('https://en.wikipedia.org/wiki/Fiji_Football_Association');
        ofcLinks.add('https://en.wikipedia.org/wiki/Tuvalu_Islands_Football_Association');

        return ofcLinks;
    }

    private static List<String> getAfricanFootballLinks() {
        List<String> africanFootballLinks = new List<String>();

        africanFootballLinks.add('https://en.wikipedia.org/wiki/Ghana_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Ethiopian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Somali_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Football_Kenya_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Botswana_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Zimbabwe_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Namibia_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Zambia');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Algerian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Tunisian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Libyan_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Egyptian_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_the_Islamic_Republic_of_Mauritania');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Malian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Nigerien_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Chadian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Sudan_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Angolan_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Mozambican_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/South_African_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Senegalese_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Lesotho_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Cameroonian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Royal_Moroccan_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Nigeria_Football_Federation');

        return africanFootballLinks;
    }

    private static List<String> getAsianFootballLinks() {
        List<String> asianFootballLinks = new List<String>();

        asianFootballLinks.add('https://en.wikipedia.org/wiki/Saudi_Arabian_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Syrian_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Lebanese_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Jordan_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Kuwait_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/United_Arab_Emirates_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Turkmenistan');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Uzbekistan_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Kazakhstan_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Afghanistan_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Pakistan_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/All_India_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/All_Nepal_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Korea_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/DPR_Korea_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Mongolian_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Thailand');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Lao_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Cambodia');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Vietnam_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Indonesia');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Singapore');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Malaysia');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Philippine_Football_Federation');        
        /*
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Saudi_Arabian_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_Islamic_Republic_of_Iran');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Japan_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Chinese_Football_Association');        
        */
        return asianFootballLinks;
    }

    private static List<String> getUefaLinks() {
        List<String> uefaLinks = new List<String>();

        uefaLinks.add('https://en.wikipedia.org/wiki/Italian_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Danish_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/French_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/German_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/San_Marino_Football_Federation');

        return uefaLinks;
    }
}
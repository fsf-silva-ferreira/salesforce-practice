/**
 * @description       : Gathering Wikipedia URLs about Football Associations into collections.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 08-09-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationLinksManager {
   
    public static List<String> getConmebolLinks() {
        List<String> conmebolLinks = new List<String>();

        conmebolLinks.add('https://en.wikipedia.org/wiki/Argentine_Football_Association');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Bolivian_Football_Federation');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Brazilian_Football_Confederation');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Chile');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Colombian_Football_Federation');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Ecuadorian_Football_Federation');
        conmebolLinks.add('https://en.wikipedia.org/wiki/Paraguayan_Football_Association');        
        conmebolLinks.add('https://en.wikipedia.org/wiki/Peruvian_Football_Federation');        
        conmebolLinks.add('https://en.wikipedia.org/wiki/Uruguayan_Football_Association');                
        conmebolLinks.add('https://en.wikipedia.org/wiki/Venezuelan_Football_Federation');                        

        return conmebolLinks;
    }

    public static List<String> getConcacafLinks() {
        List<String> concacafLinks = new List<String>();

        //North America (NAFU)
        concacafLinks.add('https://en.wikipedia.org/wiki/Canadian_Soccer_Association'); 
        concacafLinks.add('https://en.wikipedia.org/wiki/Mexican_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/United_States_Soccer_Federation');

        //Central America (UNCAF)
        concacafLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Belize');
        concacafLinks.add('https://en.wikipedia.org/wiki/Costa_Rican_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Salvadoran_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/National_Football_Federation_of_Guatemala');
        concacafLinks.add('https://en.wikipedia.org/wiki/National_Autonomous_Federation_of_Football_of_Honduras');
        concacafLinks.add('https://en.wikipedia.org/wiki/Nicaraguan_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Panamanian_Football_Federation');   
        
        //Caribbean (CFU)
        concacafLinks.add('https://en.wikipedia.org/wiki/Anguilla_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Antigua_and_Barbuda_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Aruba_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Bahamas_Football_Associatio');
        concacafLinks.add('https://en.wikipedia.org/wiki/Barbados_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Bermuda_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Bonaire_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/British_Virgin_Islands_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Cayman_Islands_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Cuba');
        concacafLinks.add('https://en.wikipedia.org/wiki/Cura%C3%A7ao_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Dominica_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Dominican_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Ligue_de_football_de_la_Guyane');
        concacafLinks.add('https://en.wikipedia.org/wiki/Ligue_guadeloup%C3%A9enne_de_football');
        concacafLinks.add('https://en.wikipedia.org/wiki/Guyana_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Haitian_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Jamaica_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Ligue_de_football_de_la_Martinique');
        concacafLinks.add('https://en.wikipedia.org/wiki/Montserrat_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Puerto_Rican_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/St._Kitts_and_Nevis_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Saint_Lucia_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Ligue_de_football_de_Saint-Martin');
        concacafLinks.add('https://en.wikipedia.org/wiki/Comit%C3%A9_Territorial_de_Football_de_Saint-Barth%C3%A9lemy');
        concacafLinks.add('https://en.wikipedia.org/wiki/Saint_Vincent_and_the_Grenadines_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Sint_Maarten_Football_Federation');
        concacafLinks.add('https://en.wikipedia.org/wiki/Surinamese_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Trinidad_and_Tobago_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/Turks_and_Caicos_Islands_Football_Association');
        concacafLinks.add('https://en.wikipedia.org/wiki/U.S._Virgin_Islands_Soccer_Federation');
        
        return concacafLinks;
    }

    public static List<String> getOfcLinks() {
        List<String> ofcLinks = new List<String>();

        ofcLinks.add('https://en.wikipedia.org/wiki/Football_Federation_American_Samoa');
        ofcLinks.add('https://en.wikipedia.org/wiki/Cook_Islands_Football_Association');
        ofcLinks.add('https://en.wikipedia.org/wiki/Fiji_Football_Association');
        ofcLinks.add('https://en.wikipedia.org/wiki/New_Caledonian_Football_Federation');
        ofcLinks.add('https://en.wikipedia.org/wiki/New_Zealand_Football');
        ofcLinks.add('https://en.wikipedia.org/wiki/Papua_New_Guinea_Football_Association'); 
        ofcLinks.add('https://en.wikipedia.org/wiki/Football_Federation_Samoa');  
        ofcLinks.add('https://en.wikipedia.org/wiki/Solomon_Islands_Football_Federation');
        ofcLinks.add('https://en.wikipedia.org/wiki/Tahitian_Football_Federation');
        ofcLinks.add('https://en.wikipedia.org/wiki/Tonga_Football_Association');        
        ofcLinks.add('https://en.wikipedia.org/wiki/Tuvalu_Islands_Football_Association');
        ofcLinks.add('https://en.wikipedia.org/wiki/Vanuatu_Football_Federation');

        return ofcLinks;
    }

    public static List<String> getAfricanFootballLinks() {
        List<String> africanFootballLinks = new List<String>();

        //Union of North African Football (UNAF)        
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Algerian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Egyptian_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Libyan_Football_Federation'); 
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Royal_Moroccan_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Tunisian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Sahrawi_Football_Federation');

        //Western African Football Union (WAFU)
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Benin_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Burkinab%C3%A9_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Cape_Verdean_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Ivorian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Gambia_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Ghana_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Guinean_Football_Federation'); 
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Guinea-Bissau');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Liberia_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Malian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_the_Islamic_Republic_of_Mauritania');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Nigerien_Football_Federation'); 
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Nigeria_Football_Federation'); 
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Senegalese_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Sierra_Leone_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Togolese_Football_Federation');

        //Central African Football Federations' Union (UNIFFAC)
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Cameroonian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Central_African_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Chadian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Congolese_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Congolese_Association_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Equatoguinean_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Gabonese_Football_Federation');   
        africanFootballLinks.add('https://en.wikipedia.org/wiki/S%C3%A3o_Tom%C3%A9an_Football_Federation');

        //Council for East and Central Africa Football Associations (CECAFA)
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Burundi');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Djiboutian_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Eritrean_National_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Ethiopian_Football_Federation');                                     
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Football_Kenya_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Rwanda_Football_Federation');  
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Somali_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Sudan_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/South_Sudan_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Tanzania_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Federation_of_Uganda_Football_Associations'); 
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Zanzibar_Football_Federation');

        //Council of Southern Africa Football Associations (COSAFA)
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Angolan_Football_Federation');        
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Botswana_Football_Association');        
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Comoros_Football_Federation');                                
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Eswatini_Football_Association');        
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Lesotho_Football_Association');                
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Malagasy_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Malawi');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Mauritius_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Mozambican_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Namibia_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Seychelles_Football_Federation');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/South_African_Football_Association');
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Zambia');                      
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Zimbabwe_Football_Association'); 
                 
        //Only an associate member of the Confederation of African Football
        africanFootballLinks.add('https://en.wikipedia.org/wiki/Ligue_r%C3%A9unionnaise_de_football');                                                                                      
                                                                                                                                                       
        return africanFootballLinks;
    }

    public static List<String> getAsianFootballLinks() {
        List<String> asianFootballLinks = new List<String>();

        //West Asian Football Federation (WAFF)
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Bahrain_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Iraq_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Jordan_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Kuwait_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Lebanese_Football_Association'); 
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Oman_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Palestinian_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Qatar_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Saudi_Arabian_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Syrian_Football_Federation'); 
        asianFootballLinks.add('https://en.wikipedia.org/wiki/United_Arab_Emirates_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Yemen_Football_Association');
        
        //Central asian Football Association (CAFA)
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Afghanistan_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_Islamic_Republic_of_Iran');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Kyrgyz_Football_Union');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Tajikistan_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Turkmenistan');        
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Uzbekistan_Football_Association'); 

        //South Asian Football Federation (SAFF)
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Bangladesh_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Bhutan_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/All_India_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Maldives');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/All_Nepal_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Pakistan_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Sri_Lanka');
        
        //East Asian Football Federation (EAFF)
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Chinese_Football_Association'); 
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Guam_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Hong_Kong,_China');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Japan_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Macau_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Mongolian_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Northern_Mariana_Islands_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/DPR_Korea_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Korea_Football_Association');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Chinese_Taipei_Football_Association');

        //ASEAN Football Federation (AFF) - Southeast Asia
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Australia');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Brunei_Darussalam');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Cambodia');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Timor-Leste');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Indonesia');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Lao_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Malaysia');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Myanmar_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Philippine_Football_Federation');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Singapore');
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Thailand');  
        asianFootballLinks.add('https://en.wikipedia.org/wiki/Vietnam_Football_Federation');                                                                               

        return asianFootballLinks;
    }

    public static List<String> getUefaLinks() {
        List<String> uefaLinks = new List<String>();

        uefaLinks.add('https://en.wikipedia.org/wiki/Albanian_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Andorran_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Armenia');
        uefaLinks.add('https://en.wikipedia.org/wiki/Austrian_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Association_of_Football_Federations_of_Azerbaijan');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Belarus');
        uefaLinks.add('https://en.wikipedia.org/wiki/Royal_Belgian_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Bosnia_and_Herzegovina');
        uefaLinks.add('https://en.wikipedia.org/wiki/Bulgarian_Football_Union');
        uefaLinks.add('https://en.wikipedia.org/wiki/Croatian_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Cyprus_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_the_Czech_Republic');
        uefaLinks.add('https://en.wikipedia.org/wiki/Danish_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/The_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Estonian_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Faroe_Islands_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Finland');
        uefaLinks.add('https://en.wikipedia.org/wiki/French_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Georgian_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/German_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Gibraltar_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Hellenic_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Hungarian_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Iceland');
        uefaLinks.add('https://en.wikipedia.org/wiki/Israel_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Italian_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Kazakhstan_Football_Federation'); 
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Kosovo'); 
        uefaLinks.add('https://en.wikipedia.org/wiki/Latvian_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Liechtenstein_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Lithuanian_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Luxembourg_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Malta_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Moldovan_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Montenegro');
        uefaLinks.add('https://en.wikipedia.org/wiki/Royal_Dutch_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Federation_of_Macedonia');
        uefaLinks.add('https://en.wikipedia.org/wiki/Irish_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Norwegian_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Polish_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Portuguese_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Ireland');
        uefaLinks.add('https://en.wikipedia.org/wiki/Romanian_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Russian_Football_Union');
        uefaLinks.add('https://en.wikipedia.org/wiki/San_Marino_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Scottish_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Serbia');
        uefaLinks.add('https://en.wikipedia.org/wiki/Slovak_Football_Association');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Slovenia');
        uefaLinks.add('https://en.wikipedia.org/wiki/Royal_Spanish_Football_Federation'); 
        uefaLinks.add('https://en.wikipedia.org/wiki/Swedish_Football_Association'); 
        uefaLinks.add('https://en.wikipedia.org/wiki/Swiss_Football_Association'); 
        uefaLinks.add('https://en.wikipedia.org/wiki/Turkish_Football_Federation');
        uefaLinks.add('https://en.wikipedia.org/wiki/Ukrainian_Association_of_Football');
        uefaLinks.add('https://en.wikipedia.org/wiki/Football_Association_of_Wales');                                                      
        
        return uefaLinks;
    }
}
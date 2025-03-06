/**
 * @description       : Introduction to interfaces.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_defining.htm
**/
public with sharing class FactoryClass {
   
    public static UrlInterface getWebsite(String websiteAddress) {
        if(websiteAddress != null) {
            if(websiteAddress.toLowerCase() == 'google' ) {                
                return new GoogleClass();
            } else
            if(websiteAddress.toLowerCase() == 'facebook' ) {                
                return new FacebookClass();
            } else {                
               throw new NoUrlFoundException('No URL found');
            }
        } else {            
            throw new NoWebsiteEnteredException('No website name entered');  
        }
    }
}
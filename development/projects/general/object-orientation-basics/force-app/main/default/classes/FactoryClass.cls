/**
 * @description       : Introduction to interfaces.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-30-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
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
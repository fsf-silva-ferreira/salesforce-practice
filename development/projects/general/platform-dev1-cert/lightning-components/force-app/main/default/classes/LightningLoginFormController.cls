/**
 * @description       : Ligtning login form controller.
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-20-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
global class LightningLoginFormController {

    public LightningLoginFormController() {}

    @AuraEnabled
    public static String login(String username, String password, String startUrl) {
        try{
            ApexPages.PageReference loginPage = Site.login(username, password, startUrl);
            aura.redirect(loginPage);

            return null;
        } catch (Exception ex) {
            return ex.getMessage();            
        }
    }
    
    @AuraEnabled
    public static Boolean getIsUsernamePasswordEnabled() {
        Auth.AuthConfiguration authConfig = getAuthConfig();
        Boolean isUsernamePasswordEnabled = authConfig.getUsernamePasswordEnabled();

        return isUsernamePasswordEnabled;
    }

    @AuraEnabled
    public static Boolean getIsSelfRegistrationEnabled() {
        Auth.AuthConfiguration authConfig = getAuthConfig();
        Boolean isSelfRegistrationEnabled = authConfig.getSelfRegistrationEnabled();

        return isSelfRegistrationEnabled;
    }

    @AuraEnabled
    public static String getSelfRegistrationUrl() {
        Auth.AuthConfiguration authConfig = getAuthConfig();
        String selfRegistrationUrl = authConfig.getSelfRegistrationUrl();

        return selfRegistrationUrl;
    }

    @AuraEnabled
    public static String getForgotPasswordUrl() {
        Auth.AuthConfiguration authConfig = getAuthConfig();
        String forgotPasswordUrl = authConfig.getForgotPasswordUrl();

        return forgotPasswordUrl;
    }
    
    @TestVisible
    private static Auth.AuthConfiguration getAuthConfig(){
        Id networkId = Network.getNetworkId();
        Auth.AuthConfiguration authConfig = new Auth.AuthConfiguration(networkId,'');

        return authConfig;
    }

    @AuraEnabled
    global static String setExperienceId(String expId) {
        // Return null if there is no error, else it will return the error message 
        try {
            if (expId != null) {
                Site.setExperienceId(expId);
            }
            
            return null; 
        } catch (Exception ex) {
            return ex.getMessage();            
        }
    }   
}
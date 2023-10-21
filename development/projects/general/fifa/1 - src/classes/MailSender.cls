/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-19-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class MailSender {
    
    public static void sendErrorMessagesToAdmins(String errorMessages) {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        List<String> adminAddresses = queryAdminAddresses();
            
       	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('[FIFA App] Error Messages');
        mail.setplaintextbody(errorMessages);
        mail.setToAddresses(adminAddresses);

        emailList.add(mail);
        
        if(!emailList.isEmpty()){
            Messaging.sendEmail(emailList);
        }	   
    } 

    private static List<String> queryAdminAddresses() {
        List<String> adminEmails = new List<String>();

        List<User> admins = [SELECT id, email from  User WHERE Profile.Name = 'System Administrator'];
        for (User admin : admins) {
            adminEmails.add(admin.email);
        }

        return adminEmails;
    }
}

/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class Notification {

    public static boolean notifyErrorsToAdmins(String title, String errorMessages) {
        try {
            Set<String> adminIds = getAdminsId();

            CustomNotificationType customNotificationType = [SELECT Id FROM CustomNotificationType WHERE DeveloperName = 'Admin_Notification'];
            
            Messaging.CustomNotification notification = new Messaging.CustomNotification();
            notification.setBody(errorMessages);
            notification.setTitle(title);
            notification.setSenderId(Userinfo.getUserId());
            notification.setNotificationTypeId(customNotificationType.Id);
            notification.setTargetId(Userinfo.getUserId());
            notification.send(adminIds);
        } catch (Exception e) {
            return false;
        }

        return true;
    }

    private static Set<String> getAdminsId() {
        Set<String> adminIds = new Set<String>();

        List<User> admins = [SELECT id from  User WHERE Profile.Name = 'System Administrator'];
        for (User admin : admins) {
            adminIds.add(admin.Id);
        }

        return adminIds;
    }
}

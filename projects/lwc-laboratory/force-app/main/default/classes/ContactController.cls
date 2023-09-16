/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-02-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactController {

    @AuraEnabled
    public static List<Contact> getContactList() {
        return 
        [
            SELECT 
                Id
                , Name
                , Title
                , Phone
                , Email
            FROM 
                Contact
            WITH 
                SECURITY_ENFORCED
            LIMIT 10
        ];
    }

    @AuraEnabled
    public static List<Contact> findContacts(String searchKey) {
        System.debug('searchKey: ' + searchKey);

        String key = '%' + searchKey + '%';

        return 
        [
            SELECT 
                Id
                , Name
                , Title
                , Phone
                , Email                
            FROM 
                Contact
            WHERE 
                Name LIKE :key 
            WITH 
                SECURITY_ENFORCED
            ORDER BY
                CreatedDate desc
            LIMIT 50
        ];
    }
}
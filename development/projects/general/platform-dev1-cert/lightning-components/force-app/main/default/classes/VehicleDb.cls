/**
 * @description       : Access to vehicles data on the database.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-19-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class VehicleDb {
    public VehicleDb() {}

    @AuraEnabled   
    public static List<Vehicle__c> getAllVehicles() {
        List<Vehicle__c> vehicles = new List<Vehicle__c>(); //List to store our vehicles
        vehicles = [select Id, Name, Year__c, Brand__c, Preview__c from Vehicle__c];
        System.debug('Vehicle list: ' + vehicles);

        return vehicles;
    }
}
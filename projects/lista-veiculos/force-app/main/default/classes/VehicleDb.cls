/**
 * @description       : Access to vehicles data on the database.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 09-02-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class VehicleDb {
    public VehicleDb() {}

    @AuraEnabled   
    public static List<Vehicle__c> getAllVehicles() {
        List<Vehicle__c> vehicles = new List<Vehicle__c>(); //Lista para receber nossos veículos
        vehicles = [select Id, Name, Year__c, Brand__c, Preview__c from Vehicle__c];
        System.debug('Lista de veículos: ' + vehicles);

        return vehicles;
    }
}

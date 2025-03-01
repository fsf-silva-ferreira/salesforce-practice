/**
 * @description       : Practicing classes ans objects in Apex.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CarExample {
    
    public String make;
    public String model;
    public Integer averageSpeed;

    public void display() {
        System.debug('Make of the car: ' + make);
        System.debug('Model of the car: ' + model);
        System.debug('Average speed of the car: ' + averageSpeed);
    }

    private Integer increaseSpeed() {
        averageSpeed += 10;

        return averageSpeed;
    }

    public void displayNewCarSpeed() {
        Integer newCarSpeed = increaseSpeed();
        System.debug('New car speed: ' + newCarSpeed);
    }
}
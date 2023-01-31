/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-31-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AnObject {
    
    public Integer id;
    public String name;

    public AnObject() {}

    public AnObject(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
}
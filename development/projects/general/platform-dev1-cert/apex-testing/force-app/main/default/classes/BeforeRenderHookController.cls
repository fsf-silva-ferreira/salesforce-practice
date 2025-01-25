/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-21-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class BeforeRenderHookController {
  
  public List<String> courses { get; private set; }

  public void populateCourses() {
    // Typically this list would be constructed with SOQL
    courses = new List<String>{
      'Irrigation Systems',
      'Soils',
      'Organic Crops'
    };
  }
}
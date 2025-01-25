/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-21-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
private class BeforeRenderHookControllerTest {

  @isTest
  static void populateCourses_sets3Courses() {
    // GIVEN
    BeforeRenderHookController controller = new BeforeRenderHookController();

    // WHEN
    controller.populateCourses();

    // THEN
    List<String> expectedCourses = new List<String>{
      'Irrigation Systems',
      'Soils',
      'Organic Crops'
    };
    
    System.assertEquals(
      expectedCourses,
      controller.courses,
      'Courses where not correctly populated'
    );
  }
}
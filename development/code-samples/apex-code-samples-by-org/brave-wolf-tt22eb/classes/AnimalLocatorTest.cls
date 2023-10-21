@isTest
public class AnimalLocatorTest {

   @isTest static void testGetCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String response = AnimalLocator.getAnimalNameById(1);
        // Verify that the response received contains fake values
        //String contentType = response.getHeader('Content-Type');
        //System.assert(contentType == 'application/json');
        String actualValue = response;
        System.debug(response);
        String expectedValue = 'chicken';
        System.assertEquals(actualValue, expectedValue);
        //System.assertEquals(200, response.getStatusCode());
	}
}
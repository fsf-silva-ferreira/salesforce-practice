/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-15-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class ExampleCalloutMock implements HttpCalloutMock {

    Integer statusCode;

    public ExampleCalloutMock(Integer statusCode) {
        this.statusCode = statusCode;
    }
  
    public HTTPResponse respond(HTTPRequest req) {
      // Create a fake response
      HttpResponse res = new HttpResponse();
      res.setHeader('Content-Type', 'application/json');
      res.setBody('{"example":"test"}');
      res.setStatusCode(this.statusCode);  // use injected status code as response
      return res;
    }
}
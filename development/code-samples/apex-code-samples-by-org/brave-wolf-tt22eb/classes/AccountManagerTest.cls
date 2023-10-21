@isTest
private class AccountManagerTest {

    private static testMethod void getAccountTest1() {
        Id recordId = createTestRecord();
        
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = 'https://brave-wolf-tt22eb-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+ 
            recordId +'/contacts' ;
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test record', thisAccount.Name);
    }

    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account TestAcc = new Account(Name='Test record');
        insert TestAcc;
        
        Contact TestCon= new Contact(LastName='Test', AccountId = TestAcc.id);
        insert TestCon;
        
        return TestAcc.Id;
    }      
}
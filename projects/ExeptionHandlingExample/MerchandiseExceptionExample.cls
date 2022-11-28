public class MerchandiseExceptionExample {

	public static void insertMerchandiseWithoutTryCatch() {
		Merchandise__c m = new Merchandise__c();
        insert m;
    }
	
    public static void insertMerchandiseSimpleTryCatch() {
    	try {
            Merchandise__c m = new Merchandise__c();
            insert m;
        } catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }    
    }
    
    public static void insertMerchandiseAdditionalTryCatch() {
        try {
            Merchandise__c m = new Merchandise__c();
            insert m;
        } catch (DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        
        try {
            System.debug('Statement after insert.');
            // Insert other records
        } catch (Exception e) {
            // Handle this exception here
        }
    }
    
    public static void insertMerchandiseWithStatementAfterBlock() {
        try {
            Merchandise__c m = new Merchandise__c();
            insert m;
        } catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        
        // This will get executed
        System.debug('Statement after insert.');
    }
}
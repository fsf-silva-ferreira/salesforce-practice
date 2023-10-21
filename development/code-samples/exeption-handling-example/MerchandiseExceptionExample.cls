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
    
    public static void createXmlStreamWriter() {
        // Declare the variable outside the try-catch block
        // so that it will be in scope for all blocks.
        XmlStreamWriter w = null;
        try {
            w = new XmlStreamWriter();
            w.writeStartDocument(null, '1.0');
            w.writeStartElement(null, 'book', null);
            w.writeCharacters('This is my book');
            w.writeEndElement(); 
            w.writeEndDocument();
        
            // Perform some other operations
            String s;
            // This causes an exception because
            // the string hasn't been assigned a value.
            Integer i = s.length();
        } catch(Exception e) {
            System.debug('An exception occurred: ' + e.getMessage());
        } finally {
            System.debug('XML String: ' + w.getXmlString());
            
            // This gets executed after the exception is handled
            System.debug('Closing the stream writer in the finally block.');
            // Close the stream writer
            w.close();                        
        }
	}
}
@isTest 
public class Upload_Init_EMTest {

    @isTest(seeAllData=true)
    static void testUpdateReportCSV() {
        try {
        
            Test.startTest();
                Upload_Init_EM initEM = new Upload_Init_EM('TestReport', 'ReportSchema');
                StaticResource[] reportCSV = [SELECT Body FROM StaticResource WHERE Name = 'TestReport' Order by Name Asc]; 
                blob csv =  reportCSV[0].body;         
                String updatedCSV =initEM.getUpdatedCSV();       
                
                System.assertNotEquals('csv body should have been updated', csv.toString(), updatedCSV);
                System.assert(updatedCSV.contains(UserInfo.getOrganizationId()), 'orgid is not updated in the csv.');
            Test.stopTest(); 
            } catch(UploadEMUserNotFoundException e) {
                
            }
    }
    
    @isTest(seeAllData=true)
    static void testUpdateURICSV() {
        try {
            Test.startTest();
                Upload_Init_EM initEM = new Upload_Init_EM('TestURI', 'URISchema');
                StaticResource[] reportCSV = [SELECT Body FROM StaticResource WHERE Name = 'TestURI' Order by Name Asc]; 
                blob csv =  reportCSV[0].body;
                
                String updatedCSV =initEM.getUpdatedCSV();
                
                System.assertNotEquals('csv body should have been updated', csv.toString(), updatedCSV);
                System.assert(updatedCSV.contains(UserInfo.getOrganizationId()), 'orgid is not updated in the csv.');
            Test.stopTest();
            } catch(UploadEMUserNotFoundException e) {
                
            }
    }

}
@isTest 
public class Upload_controller_EMTest {

    @isTest 
    static void controllerTestWithoutSeeAllData() {
        // SETUP
        Upload_controller_EM uc = new Upload_controller_EM();
        
        // UI Functions coverage
        uc.updateJobsData();
        System.assertEquals(null, uc.job_id);
        System.assertEquals(false, uc.init_isrunning);
        System.assertEquals(false, uc.process_isrunning);
    }
    
    @isTest 
    static void testUploadEMCsv() {
        // SETUP
        Upload_controller_EM uc = new Upload_controller_EM();
        Test.startTest();
            // create users upfront
            Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
            User u1 =  new User(Alias = 'standt', Email='test@g.com',EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',LocaleSidKey='en_US', ProfileId = p.Id,TimeZoneSidKey='America/Los_Angeles', UserName= 'dummyTrailhead');
            
            uc.uploadEMCsv();
            System.assertEquals(true, uc.init_isrunning);
            
        Test.stopTest();
        
        System.assertEquals(null, uc.job_id);
        System.assertEquals(true, uc.init_isrunning);
        System.assertEquals(false, uc.process_isrunning);
    }
    
    @isTest(seeAllData=true)
    static void updateJobTest() {
        // SETUP
        
        Upload_controller_EM uc = new Upload_controller_EM();
        Upload_Init_EM iem = new Upload_Init_EM('TestReport', 'ReportSchema');
        
        Test.StartTest();
            System.enqueueJob(iem);
            System.enqueueJob(new Upload_Process_EM(iem.getInsightExternalDataId()));
        Test.stopTest();
        
        ApexClass ac = [select id from apexclass where name ='Upload_Process_EM'];
        
        AsyncApexJob job = [Select ID, ApexClassID, JobType, MethodName, Status, ExtendedStatus, CreatedDate
                               From AsyncApexJob WHERE JobType = 'Queueable' and apexClassId = :ac.id
                               ORDER BY CreatedDate DESC limit 1];
                               
        
        System.assertNotEquals(null, job.id); 
        // Processing
        uc.updateJobsData(job);
        System.assertEquals(true, uc.process_iscompleted);
  }
}
public class Upload_controller_EM {    
    // Org URL
    public String orgUri{get; set;}
    public Boolean isDatasetRecentlyUpdated{get;set;}
    // UI Used variables
    public String error {get;set;}
    public String success {get;set;}    
    
    // General Job ID for queued proccesses
    public ID job_id {get; set;}
    public ID job_id2 {get; set;}
    // Which Job is running ?
    public Boolean init_isrunning {get; set;}
    public Boolean process_isrunning {get; set;}
    public Boolean process_iscompleted {get; set;}
    
    
    // =========================================================================
    //           Constructor
    // =========================================================================
    
    public Upload_controller_EM() {
        
        // Get Org URL
        String forwardedHeader = ApexPages.currentPage().getHeaders().get('X-Salesforce-Forwarded-To');
        orgUri = (forwardedHeader == null) ? ApexPages.currentPage().getHeaders().get('host') : forwardedHeader;
        isDatasetRecentlyUpdated = checkIfRecentlyUploaded();
        
    }
    
    public boolean checkIfRecentlyUploaded() {
        System.debug('***inside check method***');
        InsightsExternalData[] ied = [SELECT EdgemartLabel,LastModifiedById,LastModifiedDate FROM InsightsExternalData WHERE EdgemartLabel in('Report', 'URI') AND description = 'EM Trailhead dataset' ORDER BY LastModifiedDate DESC NULLS FIRST limit 1];
        if (ied.size() > 0) {
            System.debug('*** ied' + ied[0]);
            System.debug ( '*** current user ***' + UserInfo.getUserId());
            System.debug('*** last modified by userrr ***' + ied[0].LastModifiedById);
            
            DateTime modifiedDate = ied[0].LastModifiedDate;
            Boolean isUpdatedToday = modifiedDate.date().isSameDay(Date.today());
            Integer daysBetween = modifiedDate.date().daysBetween(Date.today());
            System.debug('isUpdatedToday ****' + isUpdatedToday);
            System.debug('days between ***' + daysBetween);
            if (isUpdatedToday || daysBetween <= 1) {
                System.debug('*** this was updated today ***');
                return true;
            }
           
        } 
        
        return false;
      
    }
    // =========================================================================
    //           UI Steps Functions
    // =========================================================================
    
    // Start Data Upload
    public void uploadEMCsv() {
        // Update jobs data
        updateJobsData();
        
        if (job_id == null) {
            // enqueue the jobs for processing
          if (!Test.isRunningTest()) {
            
                try {
                    // Init the upload
                    job_id = System.enqueueJob(new Upload_Init_EM('Report', 'ReportSchema'));
                    System.debug('***** Enquequing job upload_init_EM for Report *****' + job_id);
                    
                    job_id2 = System.enqueueJob(new Upload_Init_EM('URI', 'URISchema'));
                    System.debug('***** Enquequing job upload_init_EM for URI *****' + job_id2);
                    
                } catch (UploadEMUserNotFoundException e) {
                    error = 'No trailhead users found in this org';
                }
           }
          init_isrunning = true;
        }
        else {
            System.debug('Another Upload Process is already running.');
        }
    }
    
    // =========================================================================
    //           UI Data Utils
    // =========================================================================
    
    private void resetJobVars() {
        // If nothing is running, reset jobs variables
        job_id = null;            
        init_isrunning = false;   
        process_isrunning = false;
        process_iscompleted = false;
    }
    
    // =========================================================================
    //           UI Data Functions
    // =========================================================================
        
    // Check if a process is actually running
    public void updateJobsData() {
       resetJobVars();

        AsyncApexJob[] jobs = [Select ID, ApexClassID, JobType, MethodName, Status, ExtendedStatus, CreatedDate
                               From AsyncApexJob
                               ORDER BY CreatedDate DESC];
        
        // Processing the Job that is running
        if (jobs.size() > 0) {
            System.debug('*** There is atleast one job that has been run recently.***'); 
           updateJobsData(jobs[0]);
        }
    }
   
    public void updateJobsData(AsyncApexJob job) {
        System.debug('**** job status **** ' + job.status); 
        ApexClass apexClassForAsyncApexJob;
        
        ApexClass[] apexClass = [SELECT Name FROM ApexClass WHERE Id = :job.ApexClassID];
        
        if (apexClass.size() > 0) {
            System.debug('**** apex class for job status **** ' + apexClass[0].name); 
           apexClassForAsyncApexJob = apexClass[0];
        }  
        
        // If errored or aborted
        if (job.Status == 'Aborted' || job.Status == 'Failed') {
            error = job.ExtendedStatus;
            System.debug('An error occured for '+job + ': ' + error);
            
        } else if (job.Status == 'Completed') {
            if (apexClassForAsyncApexJob.Name == 'Upload_Process_EM') {
                process_iscompleted = true;
                success ='Dataset uploaded successfully';
                System.debug('**** Dataset uploaded ****');
            }
        } else {
            // Save general job ID
            job_id = job.ID;
            System.debug('*** job id is ***' + job_id);
            
            // Find which job it is actually running
            if (apexClassForAsyncApexJob.Name == 'Upload_Init_EM') {
                init_isrunning = true;
            } else if (apexClassForAsyncApexJob.Name == 'Upload_Process_EM') {
                process_isrunning = true;
            } else {
                // If none of the known Class is running a job, it's not related to the data manager.
                job_id = null;
            }
        }
    }
   
}
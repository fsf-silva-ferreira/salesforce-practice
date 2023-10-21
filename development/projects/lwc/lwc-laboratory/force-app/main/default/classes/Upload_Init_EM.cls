// This class 
// 1. Reads the Report and URI csv and then manipulates the rows for userId, OrgId, Timestamp, ReportId etc 
// 2. Creates a InsightsExternalData and InsightsExternalDataPart object and feeds them with updated dataset, json schema.
// Author: Bhadri Venkatesan
public class Upload_Init_EM implements Queueable {
    
    private Folder insightsApp;
    private InsightsExternalData extDataForEM;
    private InsightsExternalDataPart extDataPartForEM;
    private User[] users;
    private User bobBanditUser;
    private Integer userSize;
    private String orgId;
    private Set<String> reportDataset = new Set<String>();
    private Set<String> uriDataset = new Set<String>();
    private String nameOfFile;
    private String nameOfSchema;
    private String updatedCsv;
    
    // =========================================================================
    //           Class Functions (constructor and execute)
    // =========================================================================
    
    public Upload_Init_EM(String nameOfFile, String nameOfSchema) {
        this.nameofFile = nameOfFile;
        this.nameOfSchema = nameOfSchema;     
           
        // Query inactive Users. When users signup a wave DE org, there a bunch of inactive users created in the org.
        // We will use these users to populate the userids in our dataset.
        users = [SELECT Id,username FROM User WHERE IsActive = FALSE];
        if (users.isEmpty()) {
            throw new UploadEMUserNotFoundException('there are no users in this org');    
        }
        
        // Fetch the bad user that we want to show in report and uri.
        bobBanditUser = [SELECT Id FROM User WHERE IsActive = FALSE AND name = 'Bob Bandit'];
        
        userSize = users.size(); // This index value helps pickup a value from user list.
        
        // Setup Report/URI dataset and schema.
        setupDataSets();
    }
    
    private void setupDataSets() {
        reportDataset.add('Report');
        reportDataset.add('TestReport');
        uriDataset.add('URI');
        uriDataset.add('TestURI');
        
        // Use the current org id
        orgId = UserInfo.getOrganizationId();
        
       // Read dataset
        StaticResource query_Dataset = [SELECT Body FROM StaticResource WHERE Name = :nameofFile Order by Name Asc];        
        StaticResource query_DatasetSchema = [SELECT Body FROM StaticResource WHERE Name = :nameOfSchema Order by Name Asc];        
        
        if (query_Dataset != null && query_DatasetSchema != null) {
            StaticResource sr_Dataset = query_Dataset;
            blob blob_Dataset = sr_Dataset.Body;

            String modifiedCSV;
            if (reportDataset.contains(nameOfFile)) {
                modifiedCSV = updateReportCSV(blob_Dataset);
            } else if (uriDataset.contains(nameOfFile)) {
                modifiedCSV = updateURICSV(blob_Dataset);    
            }
            
            updatedCsv = modifiedCSV;
            blob_Dataset = Blob.valueof(modifiedCSV);
            
            blob blob_DatasetSchema = query_DatasetSchema.Body;
            
            //if (!Test.isRunningTest()) {
                insertInsightsExternalDataAndDataPart(nameOfFile, blob_DatasetSchema, blob_Dataset);
            //}
            
        }
        else {
            System.debug('***** Can\'t find data and schema file. *****');
        }
    }
    
    public String getUpdatedCSV() {
        return updatedCsv;
    }
    
    private void insertInsightsExternalDataAndDataPart(String nameOfFile, Blob blob_DatasetSchema, Blob blob_Dataset) {
    
            // get the insightappid
            insightsApp = [SELECT Id, DeveloperName,Name, AccessType,CreatedDate,Type FROM Folder where Type = 'Insights' order by createdDate desc limit 1];
            System.debug('***** Insights app id is *****: ' + insightsApp.id + '*** Developer name ***' +insightsApp.developerName);
        
            // EXTERNAL DATA
            extDataForEM = new InsightsExternalData();
            extDataForEM.Format = 'Csv';
            extDataForEM.EdgemartAlias = nameOfFile;
            extDataForEM.EdgemartLabel = nameOfFile;
            extDataForEM.Description = 'EM Trailhead dataset';
            extDataForEM.EdgemartContainer = insightsApp.id;
            extDataForEM.MetadataJson = blob_DatasetSchema;
            extDataForEM.Operation = 'Overwrite';
            extDataForEM.Action = 'None';
            
            insert extDataForEM;
            System.debug('***** Insights External Data Id for '+nameOfFile+' is: '+ extDataForEM.Id + ' *****');
            
            // EXTERNAL DATA PART
            extDataPartForEM = new InsightsExternalDataPart ();
            extDataPartForEM.InsightsExternalDataId = extDataForEM.Id;
            extDataPartForEM.DataFile = blob_Dataset;
            extDataPartForEM.PartNumber = 1;
            
            insert extDataPartForEM;
            System.debug('***** Insights External Data part Id for '+nameOfFile+' is: '+ extDataPartForEM.Id + ' *****');
    }
    
    public String updateURICSV(Blob csvFileBody) {
    
       //Query accounts and grab ids which can then be used in the URI dataset for URI_ID and URI_ID_DERIVED field.
       Account[] accounts = [Select id from Account];
       Integer accountSize = 0;
       if (accounts.size() > 0) {
          accountSize = accounts.size();
       }
       
       
       // Process the csv file
       String csvFile = csvFileBody.toString();
       
       String[] csvLines = csvFile.split('\n');
       String finalCsv;
       String[] updatedLines = new String[]{}; 
       // Append the row header first
       updatedLines.add(csvLines[0]);
       
       for (Integer i=1; i < csvLines.size(); i++) {
           String[] line = csvLines[i].split(',');
           
           Integer indexValueForUsers = Math.mod(i, userSize); // If math.mod() is cpu heavy, then change the approach.
           if (indexValueForUsers == 0) {
               indexValueForUsers = 1;
           }
           
           String userId = users[indexValueForUsers].id;
           String uriId;
           
           if (i <= 500) {
               Integer indexValueForAccounts = Math.mod(i, accountSize); 
               if (indexValueForAccounts == 0) {
                   indexValueForAccounts = 1;
               }
               
               if (i > 100 && i <= 250) {
                   uriId = accounts[1].id;
                   userId = bobBanditUser.id;
               } else {
                   uriId = accounts[indexValueForAccounts].id;
               }
           }
            // Randomize uriIds with valid account values only for few rows in the dataset.
            // Update the values in csv
               line[3] = orgId;
               line[4] = userId;
               line[16] = userId;
               line[7] = uriId;
               line[18] = uriId;
            
           // This will be used to randomize dates in timestamp field in the csv.
           Integer daysToSubtract = indexValueForUsers;
           
           // Update the timestamp
           Datetime currentDate = System.now();
           Datetime currentDateDerived = System.now();
           String timestamp = getFormattedTimestamp(daysToSubtract);// currentDate.addDays(-daysToSubtract).format('YYYYMMddHHmmss');
           String timestamp_derived = getFormattedTimestampDerivedValue(daysToSubtract); //currentDate.addDays(-daysToSubtract).format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
           
           line[1] = timestamp;
           line[15] = timestamp_derived;
           updatedLines.add(String.join(line, ','));
       }    
       
       finalCsv = String.join(updatedLines, '\n');
       System.debug('***** finalCsv is *****' + finalCsv);
       return finalCsv;
    }
    
    public String updateReportCSV(Blob csvFileBody) {
       // Query Reports
       Report[] reports = [SELECT DeveloperName FROM Report WHERE DeveloperName IN ('FY18_APAC_SKU_Leads', 'East_Region_Br_Pipeline_by_Account', 'Opps_50k_without_Sales_Team', 'CES_Top_Prospects')];
       Report highNetWorthContact = [SELECT DeveloperName FROM Report WHERE DeveloperName = 'High_Net_Worth_Contacts'];
       //TODO: handle exception to make sure that reports and users are not null.
       
       //Process the csv file
       String csvFile = csvFileBody.toString();
       
       String[] csvLines = csvFile.split('\n');
       String finalCsv;
       String[] updatedLines = new String[]{}; 
       //append the row header first
       updatedLines.add(csvLines[0]);
       
       
       for (Integer i=1; i < csvLines.size(); i++) {
           String[] line = csvLines[i].split(',');
           
           
           Integer arrayValueToFetchFromUsers = Math.mod(i, userSize); // If math.mod() is cpu heavy, then change the approach.
           if (arrayValueToFetchFromUsers == 0) {
               arrayValueToFetchFromUsers = 1;
           }
           
           // This will be used to randomize dates in timestamp field in the csv.
           Integer daysToSubtract = arrayValueToFetchFromUsers;
          
           // Fetch a random value from user array based on arrayValueToFetchFromUsers.
           String userId = users[arrayValueToFetchFromUsers].id;
           
           //Update the values in csv. As we know the positions of these fields, we can just replace the values for those particular fields alone.
           line[3] = orgId;
           line[4] = userId;
           line[25] = userId;
           
           //No need to randomize in reports as there are only 3 reports and we have to make sure that we dont hit apex heap or cpu limits.
           String reportId;
           if (i < 100) {
               reportId = reports[0].id;
           } else if (i > 100 && i <= 250) {
               // To demo one usecase of a bad user trying to view contacts before leaving the company, 
               // we will choose the user as 'Bob Bandit' and populate the csv with the reportid for HighnetworthContacts.
               reportId = highNetWorthContact.id;
               line[4] = bobBanditUser.id;
               line[25] = bobBanditUser.id;
               
           } else if (i > 250 && i < 500) {
               reportId = reports[1].id;
           } else if (i > 500 && i < 800) {
               reportId = reports[2].id;
           } else {
               reportId = reports[3].id;
           }
           
           // Now update the report ids in the csv. 
           line[15] = reportId;
           line[28] = reportId;

            
           // Update the timestamp
           Datetime currentDate = System.now();
           Datetime currentDateDerived = System.now();
           String timestamp = getFormattedTimestamp(daysToSubtract);// currentDate.addDays(-daysToSubtract).format('YYYYMMddHHmmss');
           String timestamp_derived = getFormattedTimestampDerivedValue(daysToSubtract); //currentDate.addDays(-daysToSubtract).format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
           
           line[1] = timestamp;
           line[24] = timestamp_derived;
           updatedLines.add(String.join(line, ','));
       }    
       
       finalCsv = String.join(updatedLines, '\n');
       System.debug('***** finalCsv is *****' + finalCsv);
       return finalCsv;
    }
    
    private String getFormattedTimestamp(Integer daysToSubtract) {
       Datetime currentDate = System.now();
       return currentDate.addDays(-daysToSubtract).format('YYYYMMddHHmmss');
    }
    
    private String getFormattedTimestampDerivedValue(Integer daysToSubtract) {
       Datetime currentDate = System.now();
       return currentDate.addDays(-daysToSubtract).format('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
    }
    
    public void execute(QueueableContext context) {
        
        // Enqueue the processing!
        System.debug('***** Initiated Insights External Data Processing for id : ' + extDataForEM.Id);
        if (!Test.isRunningTest()) {
            System.enqueueJob(new Upload_Process_EM(extDataForEM.Id));
        }
        
    }
    
    public String getInsightExternalDataId() {
        return extDataForEM.Id;
    }
}
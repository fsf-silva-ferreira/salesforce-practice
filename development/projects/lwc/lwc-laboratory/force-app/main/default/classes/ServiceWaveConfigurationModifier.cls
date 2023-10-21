/** ServiceWaveConfig
* Smart Wizard - Apex class to auto scan Service ORG and pre-poulate wizard Questions
* Developer: Srinivasa Peddireddy,Salil Deshmukh
* Date: Oct, 2016 , Jul 2017
* */

public with sharing class ServiceWaveConfigurationModifier extends wavetemplate.WaveTemplateConfigurationModifier{

    public override void onConfigurationRetrieval(wavetemplate.WaveTemplateInfo template)
    {
        //******************************************Initial-Requirements**********************************************************************/


        //******************************************PAGE 1**********************************************************************/
        // Auto-populate Fiscal Month
        fiscalMonthScan(template);

        //******************************************PAGE 2**********************************************************************/
        // Verify Existence of Case Record Type
        caseRcrdType(template);

        //******************************************PAGE 3**********************************************************************/
        // Verify Existence of Opportunity Record Type
        opptyRecordType(template);

         // Verify Existence of Chat
        //checkChat(template);

         // Verify Existence of Omni
        //checkOmni(template);
    }

    //*********************Validation Before APP Creation**************************************************
    // Executes when we click on Create-APP button
    public override void beforeAppCreate(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {
        // Get the user preference on org scanning
        String ScanOrg_ans = (String) answers.get('ScanOrg');

        checkIfCSATSelected(template, answers);
        checkIfKnowledgeArticleSelected(template, answers);

        // Validate only when answer's Yes to the wizard
        if(ScanOrg_ans == 'Yes')
        {

            // Verification of closed cases to avoid any APP failures
            closedCases();
            // Verification of at least one task available on respective ORG
            taskValidation();

            // Verify existence of Queues on your ORG
            queuesonOrg(template, answers);

            // Verifying Event Existence on ORG
            eventExistence(template, answers);

            // Verify Existence of Opprtunity records
            OpptyExistence(template, answers);

            // Verify Existence of Casehistory records
            caseHistoryExistence(template, answers);

            // Verify Existence of Telephony records
            telephonyExistence(template, answers);

            // Verifying Field level security of Business Hours for 'Analytics Cloud Integration User'
            existofBusinessHours(template, answers);

            //Verify if 'Analytics Cloud Integration User' has access to the necessary fields on the selected Objects based on Users responses
            integrationUserCheck(template, answers);
        }
    }

    //*********************Validation Before APP Update**************************************************
    // Executes when we click on Reset or Update button
     public override void beforeAppUpdate(wavetemplate.WaveTemplateInfo template, String previousAppVersion, wavetemplate.Answers answers)
     {
         // Get the user preference on org scanning
         String ScanOrg_ans = (String) answers.get('ScanOrg');

         checkIfCSATSelected(template, answers);
         checkIfKnowledgeArticleSelected(template, answers);

         // Validate only when answer's Yes to the wizard
         if(ScanOrg_ans == 'Yes')
         {
            // Verification of closed cases to avoid any APP failures
              closedCases();
            // Verification of at least one task available on respective ORG
            taskValidation();

             // Verify existence of Queues on your ORG
             queuesonOrg(template, answers);

             // Verifying Event Existence on ORG
             eventExistence(template, answers);

             // Verify Existence of Opprtunity records
             OpptyExistence(template, answers);

             // Verify Existence of Casehistory records
             caseHistoryExistence(template, answers);

             // Verify Existence of Telephony records
             telephonyExistence(template, answers);

             // Verifying Field level security of Business Hours for 'Analytics Cloud Integration User'
             existofBusinessHours(template, answers);

             //Verify if 'Analytics Cloud Integration User' has access to the necessary fields on the selected Objects based on Users responses
             integrationUserCheck(template, answers);
         }
     }

    //***** Initial validation - verify Existence of Closed Cases
    private void checkIfCSATSelected(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {

            if (answers.get('TrackCSAT') == 'Yes' )
            {

             Map<String, Object>  variableAnswer = (Map<String, Object>) answers.get('CSATField');
             String variableField = (String) variableAnswer.get('fieldName');
             String variableSobject = (String) variableAnswer.get('sobjectName');

                if(String.isBlank(variableField))
                {
                	 String CsatErrorMessage = ' You answered "yes" to the configuration wizard question that asked if you track CSAT in Service Cloud, but you did not indicate the fields you use to track the data. Go back to the wizard and select the fields.';
            		 throw new wavetemplate.TemplateInterruptException(CsatErrorMessage);
                           }
            }

    }

        private void checkIfKnowledgeArticleSelected(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {
        try{
            if (answers.get('IncludeKnowledge') == 'Yes' && String.isBlank(((String)answers.get('KnowldegeArticleType'))) )
            {

            String knowledgeArticleErrorMessage = 'You answered "yes" to the configuration wizard question that asked if you use Salesforce Knowledge in Service Cloud, but you did not indicate an article type to include in Service Analtyics. Go back to the wizard and select an article type.';
            throw new wavetemplate.TemplateInterruptException(knowledgeArticleErrorMessage);


            }
        }
        catch(TypeException e)
        {}
    }
  //***** Initial validation - verify Existence of Closed Cases
    private void closedCases()
    {
        try {

            List<Case> countofClosedCases = Database.query('SELECT id FROM case where status = \'Closed\' limit 2');
            if (countofClosedCases.isEmpty())
            {
                throw new wavetemplate.TemplateInterruptException('Go to service cloud, close a Case, then rerun the wizard.');
            }
        } catch(Exception e) { }
    }



    //***** Initial validation - Verify Existence of Tasks
    private void taskValidation()
    {
        try {
            List<Task> taskCount = Database.query('SELECT id FROM Task limit 2');
            if(taskCount.isEmpty())
            {
                throw new wavetemplate.TemplateInterruptException('Go to service cloud, close a Task, then rerun the wizard');
            }
        } catch(Exception e) { }
    }

    //***** Page 1 - Auto-populate Fiscal Month
    private void fiscalMonthScan(wavetemplate.WaveTemplateInfo template)
    {
        try {
            Map<Integer, String> FiscalMonth = new Map<Integer, String>
            {1 => '01 - January',
                2 => '02 - February',
                3 => '03 - March',
                4 => '04 - April',
                5 => '05 - May',
                6 => '06 - June',
                7 => '07 - July',
                8 => '08 - August',
                9 => '09 - September',
                10 => '10 - October',
                11 => '11 - November',
                12 => '12 - December'};


            Integer Month = [Select FiscalYearStartMonth FROM Organization].FiscalYearStartMonth;
            template.getVariables().get('Fiscal_Month').setComputedValue(FiscalMonth.get(Month));
        } catch(Exception e)
        {
            template.getVariables().get('Fiscal_Month').setComputedValue('01 - January');
        }
    }


    //***** Page 2 - Auto-populate queues by verifying queues with cases
    private void queuesonOrg(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {
        try {
            String Queues_ans = (String) answers.get('IncludeQueueNames');
            if (Queues_ans == 'Yes')
            {
                Integer lstQueues = database.countQuery('select count() from QueueSobject where SobjectType in (\'Case\') limit 2');
                if (lstQueues <= 0)
                {
                    throw new wavetemplate.TemplateInterruptException('Your org does not use queues. Go back to that answer and change it to NO');
                }
            }
        } catch (Exception e) { }
    }


    //***** Page 2 - Auto-populate Case RecordTypes by verifying Existence of records on recordtype object with sobjecttype as case.
    private void caseRcrdType(wavetemplate.WaveTemplateInfo template)
    {
        try {
            wavetemplate.UIPage Page2of5 = template.getUI().getPages().get(1);
            List<RecordType> caserecordtypes = Database.query('SELECT Id FROM RecordType WHERE SObjectType=\'Case\' limit 2');
            if (caserecordtypes.isEmpty())
            {
                template.getVariables().get('IncludeCaseRecordTypes').setComputedValue('No');
                Page2of5.getVariables().get('IncludeCaseRecordTypes').setVisibility(wavetemplate.VisibilityEnum.disabled);

                Map<String, wavetemplate.VariableDefinition> variables = template.getVariables();
                wavetemplate.VariableDefinition variableDtls = variables.get('IncludeCaseRecordTypes');
                variableDtls.setDescription('If the picklist is disabled your org is not set up with record types.');
            }
            else
            {
                template.getVariables().get('IncludeCaseRecordTypes').setComputedValue('Yes');
            }
        } catch(Exception e) { }
    }

    //***** Page 3 - Auto-populate CaseHistory by verifying Existence of records on Casehistory object.
    private void caseHistoryExistence(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {
        try {
            String IncludeCaseHistory_ans = (String) answers.get('IncludeCaseHistory');
            if (IncludeCaseHistory_ans == 'Yes')
            {
                List<casehistory> casehistoryrecords = Database.query('select Id from casehistory where field in (\'status\',\'owner\') limit 2');
                if (casehistoryrecords.isEmpty())
                {
                    throw new wavetemplate.TemplateInterruptException('Your org does not use case history. Go back to that answer and change it to NO');
                }
            }
        } catch(Exception e) { }
    }

    //***** Page 3 - Auto-populate Telephony by verifying Existence of records on Task object with calldurationinseconds as >0.
    private void telephonyExistence(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {
        try {
            String IncludeTelephony_ans = (String) answers.get('IncludeTelephony');
            if (IncludeTelephony_ans == 'Yes')
            {
                List<Task> tasktelephony = Database.query('SELECT Id FROM Task WHERE CallDurationInSeconds > 0 limit 2');
                if (tasktelephony.isEmpty())
                {
                    throw new wavetemplate.TemplateInterruptException('Your org does not use telephony records. Go back to that answer and change it to NO');
                }
            }
        } catch (Exception e) { }
    }

    //***** Page 3 - Auto-populate Opportunities by verifying Existence of records on Opportunity object.
    private void OpptyExistence(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {
        try {
            String IncludeOpportunity_ans = (String) answers.get('IncludeOpportunity');
            if(IncludeOpportunity_ans == 'Yes')
            {
                wavetemplate.UIPage Page3of5 = template.getUI().getPages().get(2);
                List<Opportunity> Opptyrecords = Database.query('SELECT Id FROM Opportunity limit 2');
                if (Opptyrecords.isEmpty())
                {
                    throw new wavetemplate.TemplateInterruptException('Your org does not use Opportunities. Go back to that answer and change it to NO');
                }
            }

        } catch (Exception e) { }
    }

    //***** Page 3 - Auto-populate Oppor-Recordtype by verifying Existence of records on recordtype object with sobjecttype as opportunities.
    private void opptyRecordType(wavetemplate.WaveTemplateInfo template)
    {
        try {
            wavetemplate.UIPage Page3of5 = template.getUI().getPages().get(2);
            List<RecordType> opporrecordtypes = Database.query('SELECT Id FROM RecordType WHERE SObjectType=\'Opportunity\' limit 2');
            if (opporrecordtypes.isEmpty())
            {
                template.getVariables().get('IncludeOpportunityRecordTypes').setComputedValue('No');
                Page3of5.getVariables().get('IncludeOpportunityRecordTypes').setVisibility(wavetemplate.VisibilityEnum.disabled);

                Map<String, wavetemplate.VariableDefinition> variables = template.getVariables();
                wavetemplate.VariableDefinition variableDtls = variables.get('IncludeOpportunityRecordTypes');
                variableDtls.setDescription('If the picklist is disabled your org is not set up with record types.');
            }
            else
            {
                template.getVariables().get('IncludeOpportunityRecordTypes').setComputedValue('Yes');
            }
        } catch(Exception e) { }

    }

    //***** Page 3 - Auto-populate Events by verifying Existence of records on event object.
    private void eventExistence(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {
        try {
            String IncludeEvent_ans = (String) answers.get('IncludeEvent');
            if(IncludeEvent_ans == 'Yes')
            {
                wavetemplate.UIPage Page3of5 = template.getUI().getPages().get(2);
                List<Event> eventrecords = Database.query('SELECT Id FROM Event limit 2');
                if(eventrecords.isEmpty())
                {
                    throw new wavetemplate.TemplateInterruptException('Your org does not use events. Go back to that answer and change it to NO');
                }
            }
        } catch(Exception e) { }
    }

    //***** Page 3 - Verify accessability of Business Hours on Case object
    private void existofBusinessHours(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {
        try {
            String IncludeBusinessHours_ans = (String) answers.get('IncludeBusinessHours');
            if(IncludeBusinessHours_ans == 'Yes')
            {
                wavetemplate.UIPage Page3of5 = template.getUI().getPages().get(2);
                List<FieldPermissions> permbh = Database.query('SELECT PermissionsRead, PermissionsEdit FROM FieldPermissions WHERE SObjectType = \'case\' and Field = \'Case.BusinessHours\' and parentid in (select id from permissionset where PermissionSet.Profile.Name = \'Analytics Cloud Integration User\')');
                if (permbh.isEmpty())
                {
                    throw new wavetemplate.TemplateInterruptException('Your org does not have access to business hours. Enable visibility or go back to that answer and change it to NO');
                }
            }
        } catch(Exception e) { }
    }
/*
    //***** Page 3 - Auto-populate Chat by verifying Existence of records on chat object.
    private void checkChat(wavetemplate.WaveTemplateInfo template)
  	{


        try {

            if(answers.get('IncludeChat') == 'Yes')
            {
                wavetemplate.UIPage Page3of5 = template.getUI().getPages().get(2);
                List<LiveChatTranscript> chatrecords = [SELECT Id FROM LiveChatTranscript limit 2];
                if(chatrecords.isEmpty())
                {
                    throw new wavetemplate.TemplateInterruptException('Looks Like your org does not have any chat records. Please go back to that answer and change it to "NO"');
                }
            }
        } catch(Exception e) { }


           try {
            wavetemplate.UIPage Page3of5 = template.getUI().getPages().get(2);


            	String objName = 'LiveChatTranscript';
				Boolean isAccessible = false;
                Boolean isEmpty = true;

               isAccessible = Schema.getGlobalDescribe().get(objName).getDescribe().isAccessible();

               if(isAccessible)
               {
                   List<LiveChatTranscript> chatrecords = [SELECT Id FROM LiveChatTranscript limit 2];
                   isEmpty = chatrecords.isEmpty();
               }
            if (isAccessible == true && isEmpty == false)
            {
                template.getVariables().get('IncludeChat').setComputedValue('No');
                Page3of5.getVariables().get('IncludeChat').setVisibility(wavetemplate.VisibilityEnum.disabled);

                Map<String, wavetemplate.VariableDefinition> variables = template.getVariables();
                wavetemplate.VariableDefinition variableDtls = variables.get('IncludeChat');
                variableDtls.setDescription('If the picklist is disabled your org does not have chat records.');
            }
            else
            {
                template.getVariables().get('IncludeChat').setComputedValue('Yes');
            }
        } catch(Exception e) { }
    }

    private void checkOmni(wavetemplate.WaveTemplateInfo template)
  	{
       try {
            wavetemplate.UIPage Page3of5 = template.getUI().getPages().get(2);

           String objName = 'LiveChatTranscript';
				Boolean isAccessible = false;
                Boolean isEmpty = true;

               isAccessible = Schema.getGlobalDescribe().get(objName).getDescribe().isAccessible();

               if(isAccessible)
               {
                   List<AgentWork> omniRecords = [SELECT Id FROM AgentWork limit 2];
                   isEmpty = omniRecords.isEmpty();
               }
            if (isAccessible == true && isEmpty == false)
            {
                template.getVariables().get('IncludeOmni').setComputedValue('No');
                Page3of5.getVariables().get('IncludeOmni').setVisibility(wavetemplate.VisibilityEnum.disabled);

                Map<String, wavetemplate.VariableDefinition> variables = template.getVariables();
                wavetemplate.VariableDefinition variableDtls = variables.get('IncludeOmni');
                variableDtls.setDescription('If the picklist is disabled your org does not have chat records.');
            }
            else
            {
                template.getVariables().get('IncludeOmni').setComputedValue('Yes');
            }
        } catch(Exception e) { }
    }

*/
    //default integration user check
    public Map<String, Set<String>> checkIntegrationUserAccessToDefaults(Boolean checkDefaults,wavetemplate.Answers answers){

        //Fields which are always in the dataflow

        Set<String> globalDefaultAccount = new Set<String> {'Name','Id','Industry'};
        Set<String> globalDefaultCase = new Set<String>{'AccountId','ContactId','OwnerId','Id','IsClosed','CreatedDate','LastModifiedDate','IsEscalated','CaseNumber','RecordTypeId'};
        Set<String> globalDefaultContact = new Set<String> {'Name','Id'};
        Set<String> globalDefaultTask = new Set<String> {'Id','CallObject','CallDurationInSeconds','CallDisposition','CallType','OwnerId','Status','Priority','IsClosed','TaskSubtype','CreatedDate','ActivityDate','LastModifiedDate','Subject'};
        Set<String> globalDefaultUser = new Set<String> {'CallCenterId','Name','UserRoleId','Id'};
        Set<String> globalDefaultUserRole = new Set<String> {'Id','Name','ParentRoleId','LastModifiedDate','LastModifiedById','SystemModstamp'};

        //Depends on IncludeBusinessHours=Yes
        Set<String> globalDefaultBusinessHours = new Set<String> {'Id','FridayEndTime','FridayStartTime','Name','MondayEndTime','MondayStartTime','SaturdayEndTime','SaturdayStartTime','SundayEndTime','SundayStartTime','ThursdayEndTime','ThursdayStartTime','TimeZoneSidKey','TuesdayEndTime','TuesdayStartTime','WednesdayEndTime','WednesdayStartTime'};

        //Depends on IncludeCaseHistory=Yes
        Set<String> globalDefaultCaseHistory = new Set<String> {'CaseId','CreatedById','CreatedDate','Field','Id','NewValue','OldValue'};

        //Depends on IncludeEvent=Yes
        Set<String> globalDefaultEvent = new Set<String> {'OwnerId','CreatedDate','LastModifiedDate','ActivityDate','EndDateTime','Subject','ShowAs','DurationInMinutes','EventSubtype','WhatId'};

        //Depends on IncludeOpportunity=Yes
        Set<String> globalDefaultOpportunity = new Set<String> {'Id','AccountId','OwnerId','Name','StageName','LeadSource','IsWon','IsClosed','ForecastCategory','ForecastCategoryName','CreatedDate','CloseDate','Amount','CreatedById','RecordTypeId'};

        //Depends on IncludeQueue=Yes
        Set<String> globalDefaultQueue = new Set<String> {'Id','Name'};

        //Recordtypes is included in following condition
        //"condition": "${((Variables.IncludeOpportunityRecordTypes == 'No' || Variables.IncludeOpportunity == 'No')  && Variables.IncludeCaseRecordTypes == 'No')}",
        Set<String> globalDefaultRecordTypes = new Set<String> {'Id','Name'};

        //Chat related objects
        //Depends on IncludeChat=Yes
        Set<String> globalDefaultLiveChatTranscriptEvent = new Set<String> {'Detail','Time','Type','LastModifiedDate','Type','AgentId'};
        Set<String> globalDefaultLiveChatTranscript = new Set<String> {'Abandoned','AverageResponseTimeOperator','MaxResponseTimeOperator','OperatorMessageCount','Body','Browser','BrowserLanguage','CaseId','ChatDuration','ChatKey','CreatedDate','IsDeleted','EndTime','EndedBy','LastModifiedDate','LastReferencedDate','LastViewedDate','LiveChatButtonId','Id','Name','Location','OwnerId','Platform','ReferrerUri','RequestTime','ScreenResolution','StartTime','Status','SupervisorTranscriptBody','SystemModstamp','UserAgent','AverageResponseTimeVisitor','IpAddress','MaxResponseTimeVisitor','VisitorMessageCount','WaitTime'};
        Set<String> globalDefaultLiveChatButton = new Set<String> {'MasterLabel','CustomAgentName','Id'};

        //Omni related objects
        //Depends on IncludeOmni=Yes
        Set<String> globalDefaultAgentWork = new Set<String> {'AcceptDateTime','ActiveTime','AgentCapacityWhenDeclined','Id','AssignedDateTime','CancelDateTime','CloseDateTime','CreatedDate','DeclineDateTime','DeclineReason','IsDeleted','HandleTime','LastModifiedDate','Name','CapacityPercentage','PushTimeout','PushTimeoutDateTime','RequestDateTime','SpeedToAnswer','Status','SystemModstamp','CapacityWeight','UserId','OriginalQueueId','ServiceChannelId','WorkItemId'};
        Set<String> globalDefaultServiceChannel = new Set<String> {'DeveloperName','MasterLabel','Id'};
        Set<String> globalDefaultUserServicePresence = new Set<String> {'AtCapacityDuration','AverageCapacity','ConfiguredCapacity','CreatedDate','IsDeleted','IdleDuration','IsAway','IsCurrentState','LastModifiedDate','Name','StatusDuration','StatusEndDate','StatusStartDate','SystemModstamp','Id','UserId','ServicePresenceStatusId'};
        Set<String> globalDefaultServicePresenceStatus = new Set<String> {'MasterLabel','Id'};

        //Depends on 'IncludeQueueNames') == 'Yes'OR 'IncludeOmni' == 'Yes'
        Set<String> globalDefaultGroup = new Set<String> {'Name','Id'};

        // knowledge related objects
        // //Depends on IncludeKnowledge=Yes
        Set<String> globalDefaultCaseArticle = new Set<String> {'ArticleVersionNumber','CreatedDate','CaseId','CreatedById','KnowledgeArticleId','IsSharedByEmail'};
        Set<String> globalDefaultDataCategorySelection = new Set<String> {'DataCategoryGroupName','DataCategoryName','ParentId'};
        Set<String> globalDefaultViewStat = new Set<String> {'Channel','ParentId','ViewCount','NormalizedScore'};
        Set<String> globalDefaultVoteStat = new Set<String> {'Channel','ParentId','NormalizedScore'};
        Set<String> globalDefaultKa = new Set<String> {'Id','ArticleNumber','CaseAssociationCount','CreatedById','CreatedDate','FirstPublishedDate','LastPublishedDate','LastModifiedById'};
        Set<String> globalDefaultKav = new Set<String> {'Id','ArticleNumber','CreatedById','CreatedDate','OwnerId','PublishStatus','IsLatestVersion','IsVisibleInApp','IsVisibleInCsp','IsVisibleInPkb','IsVisibleInPrm','KnowledgeArticleId','Title','VersionNumber'};

        Map<String, Set<String>> defaultValues = new Map<String, Set<String>>();
        Map<String, Set<String>> inaccessible = new Map<String, Set<String>>();

        //Default values as determined by variables.json
        Set<String> defaultCase = new Set<String>{'Reason','Type','Origin','ClosedDate','Status','Priority'};
		Set<String> defaultTask = new Set<String>{'WhatId'};
        if(!checkDefaults)
        {
            //this means we have checked the real values that the user has selected, so we will not check default values
            //will be useful for one click install
            defaultCase.clear();
        }


        //Add values which are always present in the dataflow

        defaultCase.addAll(globalDefaultCase);

        //Build an object map of fields that will be extracted in app .
        //We will check check Integration user access on this map next



         if (answers.get('IncludeTelephony') == 'No')
        {
            defaultTask.clear();
        }
        defaultTask.addAll(globalDefaultTask);

        if (answers.get('IncludeBusinessHours') == 'Yes')
        {

            Set<String> bussinessHourId = new Set<String>{'BusinessHoursId'};
            defaultCase.addAll(bussinessHourId);
        }
        defaultValues.put('Case',defaultCase);
        defaultValues.put('Account',globalDefaultAccount);
        defaultValues.put('Contact',globalDefaultContact);

        defaultValues.put('User',globalDefaultUser);
        defaultValues.put('UserRole',globalDefaultUserRole);
        defaultValues.put('Task',defaultTask);

        if (answers.get('IncludeBusinessHours') == 'Yes')
        {
            defaultValues.put('BusinessHours',globalDefaultBusinessHours);
        }
        if (answers.get('IncludeCaseHistory') == 'Yes')
        {
            defaultValues.put('CaseHistory',globalDefaultCaseHistory);
        }
        if (answers.get('IncludeEvent') == 'Yes')
        {
            defaultValues.put('Event',globalDefaultEvent);
        }
        if (answers.get('IncludeOpportunity') == 'Yes')
        {
            defaultValues.put('Opportunity',globalDefaultOpportunity);
        }
        if (answers.get('IncludeQueueNames') == 'Yes'|| answers.get('IncludeOmni') == 'Yes')
        {
            defaultValues.put('Group',globalDefaultQueue);
        }
        //"condition": "${((Variables.IncludeOpportunityRecordTypes == 'No' || Variables.IncludeOpportunity == 'No')  && Variables.IncludeCaseRecordTypes == 'No')}",
        if (!((answers.get('IncludeOpportunityRecordTypes') == 'No' || answers.get('IncludeOpportunity') == 'No') && answers.get('IncludeCaseRecordTypes') == 'No'))
        {
            defaultValues.put('RecordType',globalDefaultRecordTypes);
        }
        if (answers.get('IncludeChat') == 'Yes')
        {
            defaultValues.put('LiveChatTranscriptEvent',globalDefaultLiveChatTranscriptEvent);
            defaultValues.put('LiveChatTranscript',globalDefaultLiveChatTranscript);
            defaultValues.put('LiveChatButton',globalDefaultLiveChatButton);
        }
        if (answers.get('IncludeOmni') == 'Yes')
        {
        //    defaultValues.put('AgentWork',globalDefaultAgentWork);
        //    defaultValues.put('ServiceChannel',globalDefaultServiceChannel);
        //    defaultValues.put('ServicePresenceStatus',globalDefaultServicePresenceStatus);
        //    defaultValues.put('UserServicePresence',globalDefaultUserServicePresence);
        }
        if (answers.get('IncludeKnowledge') == 'Yes')
        {
            defaultValues.put('CaseArticle',globalDefaultCaseArticle);


            Map<String, Object>  variableAnswer = (Map<String, Object>) answers.get('KnowldegeArticleType');

            String KnowledgeObject_Prefix = (String) variableAnswer.get('sobjectName');
    		KnowledgeObject_Prefix = KnowledgeObject_Prefix.remove('__kav');

            String DataCategorySelectionObject = KnowledgeObject_Prefix +'__DataCategorySelection';
            defaultValues.put(DataCategorySelectionObject,globalDefaultDataCategorySelection);

            String ViewStatObject = KnowledgeObject_Prefix +'__ViewStat';
            defaultValues.put(ViewStatObject,globalDefaultViewStat);

            String VoteStatObject = KnowledgeObject_Prefix +'__VoteStat';
            defaultValues.put(VoteStatObject,globalDefaultVoteStat);

            String KaObject = KnowledgeObject_Prefix +'__ka';
            defaultValues.put(KaObject,globalDefaultKa);

            String KavObject = KnowledgeObject_Prefix +'__kav';
            defaultValues.put(KavObject,globalDefaultKav);


        }
        // Now check each field that we added to the map to see if Integration user actually has access
        for (String sObjectName: defaultValues.keySet())
        {
            for(String field: defaultValues.get(sObjectName))
            {
                if(!wavetemplate.Access.integUserHasAccessToSObjectField(sObjectName, field))
                {
                    //this means Integration user does not have access to this field

                    System.debug('inaccessibleObject ' + sObjectName);
                    System.debug('inaccessibleFields ' + field);

                    // add the inaccessible fields to the list
                    if ( inaccessible.containsKey(sObjectName))
                    {
                    // add it to existing entry
                        inaccessible.get(sObjectName).add(field);
                    } else
                    {
                        // create a new entry
                        Set<String> s = new Set<String>();
                        s.add(field);
                        inaccessible.put(sObjectName, s);
                    }
                }

            }
        }
        if (! inaccessible.isEmpty()){
            // Construct the message
            String message = 'The following fields are inaccessible for the Integration User. Go to org setup, grant the Integration User access and hit Create again.\n';
            for (String sobj: inaccessible.keySet()) {
                Set<String> fields = inaccessible.get(sobj);
                message += sobj + ': ' + String.join(new List<String>(fields), ',') + '\n';
            }
        }
        return inaccessible;
    }
    //***** Integration User Check
    public String checkIntegrationUserAccessToEverything(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {
        Map<String, Set<String>> inaccessible = new Map<String, Set<String>>();

        // go through all the Variables we have
        for (wavetemplate.VariableDefinition variable: template.getVariables().values()) {
            String variableName = variable.getName();
            variable.getDescription();

            wavetemplate.VariableTypeEnum type = variable.getVariableType().getType();
            System.debug('Variable: ' + variableName);
            System.debug('Type: ' + type);

            // according to the type of the variable call the right function to check access
            if (type == wavetemplate.VariableTypeEnum.ArrayType)
            {
                // array variable - can have multiple fields selected
                wavetemplate.VariableTypeEnum itemsType = variable.getVariableType().getItemsType().getType();
                System.debug('Items type: ' + itemsType);

                // only check array variables with sObjectFields inside them
                if (itemsType == wavetemplate.VariableTypeEnum.SobjectFieldType)
                {
                    List<Object> dflt = (List<Object>) variable.getDefaultValue();

                    Map<String, Object> fdflt = (Map<String, Object>) dflt[0];
                    String variableSobject = (String) fdflt.get('sobjectName');

                    List<String> inaccessibleFields = wavetemplate.Access.checkIntegUserAccessToArrayOfSObjectFields(variableName, template, answers);
                    System.debug('inaccessibleFields ' + inaccessibleFields);

                    if (! inaccessibleFields.isEmpty())
                    {
                        // find out what sobject the variable is on

                        System.debug('variableSobject: ' + variableSobject);
                        // add the inaccessible fields to the list
                        if ( inaccessible.containsKey(variableSobject))
                        {
                            // add it to existing entry
                            inaccessible.get(variableSobject).addAll(inaccessibleFields);
                        } else
                        {
                            // create a new entry
                            inaccessible.put(variableSobject, new Set<String>(inaccessibleFields));
                        }
                    }

                }
            } else if (type == wavetemplate.VariableTypeEnum.SobjectFieldType)
            {
                Map<String, Object>  variableAnswer = (Map<String, Object>) answers.get(variableName);
                String variableField = (String) variableAnswer.get('fieldName');
                String variableSobject = (String) variableAnswer.get('sobjectName');
            	Boolean hasAccess = true;

                System.debug('variableField: ' + variableField + 'from object:  ' + variableSobject);
                System.debug('access? ' + hasAccess);

                if(answers.get('TrackCSAT') == 'No')
                {
                    if(variableName != 'CSATField' && variableName != '{{Variables.CSATObj.sobjectName}}' )
                    {
                         hasAccess = wavetemplate.Access.integUserHasAccessToSObjectField(variableName, template, answers);

                    }
                }
                else
                {
                    hasAccess = wavetemplate.Access.integUserHasAccessToSObjectField(variableName, template, answers);
                }

                // if no access add it to the list
                if (! hasAccess)
                {
                        // add the inaccessible fields to the list
                        if ( inaccessible.containsKey(variableSobject))
                        {
                            // add it to existing entry
                            inaccessible.get(variableSobject).add(variableField);
                        } else
                        {
                            // create a new entry
                            Set<String> s = new Set<String>();
                            s.add(variableField);
                            inaccessible.put(variableSobject, s);
                        }

                }
            }
        }
        System.debug('inaccessible stuff: ' + inaccessible);

        //now check for defaults
        Boolean checkDefault = false; //we will use this for one click install

        //check default selection and things always present in dataflow

        Map<String, Set<String>> defaultsInaccessible = checkIntegrationUserAccessToDefaults(checkDefault,answers);
        for(String sObjectNames : defaultsInaccessible.KeySet())
        {
            if ( inaccessible.containsKey(sObjectNames))
            {
                // add it to existing entry
                inaccessible.get(sObjectNames).addAll(defaultsInaccessible.get(sObjectNames));
            } else
            {
                // create a new entry
                inaccessible.put(sObjectNames, defaultsInaccessible.get(sObjectNames));
            }
        }

        if (! inaccessible.isEmpty())
        {
            // Construct the message and add the inaccessible items to the message
            String message = 'The Analytics Cloud Integration User requires access to all Salesforce fields that will be available in the app. In Salesforce Setup, set field-level security to enable the Analytics Integration User to see the following fields. See "Create and Share the Service Analytics App" in Salesforce Help for details. \n';

            for (String sobj: inaccessible.keySet())
            {
                Set<String> fields = inaccessible.get(sobj);
                message += sobj + ': ' + String.join(new List<String>(fields), ', ') + '\n';
            }
            return message;

        }
        return null;
    }

    /**** Method to do integration User check and display error message if any *****/
    private Boolean integrationUserCheck(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {

            boolean errorFlag = false;
        Integer ErrorCount = 1;
        string ErrorString = 'Your org does not currently meet minimum data requirements. Fix the following issues before creating Service Analytics.';

        String IntegrationMessage = checkIntegrationUserAccessToEverything(template, answers);

        if(IntegrationMessage != null)
        {

            ErrorString = ErrorString + '\n' + '(' + ErrorCount +')' + IntegrationMessage;
            errorFlag = true;
            ErrorCount++;

        }
        if(errorFlag == true)
        {
            throw new  wavetemplate.TemplateInterruptException(ErrorString);
            return false;
        }

        return true;



    }
}
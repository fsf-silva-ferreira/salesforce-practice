/**
 * @description       : Invoking Flow from Apex.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-15-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class OpportunitySearchByFlow {
    
    //Opportunity ID samples: 
    //0064W00000vxT8PQAU
    //0064W00000vxT8NQAU
    //0064W00000vxT8GQAU
    public static String getStageName(String opportunityId) {
        //* 1. Create input params map
        Map<String,Object> inputParams = new Map<String,Object>();
        inputParams.put('opportunityId', opportunityId);

        //* 2. Communicate with Flow
        Flow.Interview.Invoke_Flow_via_Apex getStageNameByOpportunityId = new Flow.Interview.Invoke_Flow_via_Apex(inputParams);
        getStageNameByOpportunityId.start();

        //* 3. Retrieve Opportunity stage name
        String stageName = (String) getStageNameByOpportunityId.getVariableValue('opportunityStageName');
        System.debug('Current stage of the opportunity is: ' + stageName);

        return stageName;
    }
}
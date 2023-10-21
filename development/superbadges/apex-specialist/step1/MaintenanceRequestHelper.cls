public with sharing class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(List<case> caseList) {
        List<case> newCases = new List<case>();
        Map<String,Integer> result=getDueDate(caseList);
        
        for(Case c : caseList){
            if(c.status=='closed') {
                if(c.type=='Repair' || c.type=='Routine Maintenance'){
                    Case newCase = new Case();
                    newCase.Status='New';
                    newCase.Origin='web';
                    newCase.Type='Routine Maintenance';
                    newCase.Subject='New Routine Maintenance Request';
                    newCase.Vehicle__c=c.Vehicle__c;
                    newCase.Equipment__c=c.Equipment__c;
                    newCase.Date_Reported__c=Date.today();
                    newCase.Date_Due__c=Date.today() + result.get(c.Id);
                    
                    newCases.add(newCase);
                }
            }
        }
        
        insert newCases;
    }
    
    public static  Map<String,Integer> getDueDate(List<case> CaseIDs){
        Map<String,Integer> result = new Map<String,Integer>();
        Map<Id, case> caseKeys = new Map<Id, case> (CaseIDs);
        List<aggregateresult> wpc=[select 
                                   		Maintenance_Request__r.ID cID,
                                   		min(Equipment__r.Maintenance_Cycle__c)cycle
        							from 
                                   		Equipment_Maintenance_Item__c 
                                   	where  
                                   		Maintenance_Request__r.ID in :caseKeys.keySet() 
                                   	group by             
                                   		Maintenance_Request__r.ID ];
        for(AggregateResult res :wpc){
            Integer addDays=0;
            if(res.get('cycle')!=null) {
            	addDays+=Integer.valueOf(res.get('cycle'));
            }
            result.put((String)res.get('cID'),addDays);
        }
        
        return result;
    }
}
Public Class ProcessbuilderInvocation {
    
    @InvocableMethod
    public static void updateChildRecords(List<Id> oppIds) {
        List<OpportunityLineItem> oppLineItemToBeUpdated = [SELECT id,is_deactivated__c FROM OpportunityLineItem WHERE UnitPrice > 500 AND OpportunityId IN : oppIds];
        for(OpportunityLineItem oppItem : oppLineItemToBeUpdated) {
            oppItem.is_deactivated__c = true;
        }
        
        try {
            UPDATE oppLineItemToBeUpdated;  
        }Catch(Exception exp) {
            System.debug('-- Exception raised due to: ' + exp.getMessage());
        }
    }
}
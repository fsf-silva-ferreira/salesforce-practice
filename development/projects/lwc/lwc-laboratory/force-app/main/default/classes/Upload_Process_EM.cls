public class Upload_Process_EM implements Queueable {
    private InsightsExternalData extData;
    
    // =========================================================================
    //           Class Functions (constructor and execute)
    // =========================================================================
    
    public Upload_Process_EM(Id extDataId) {
        System.debug('Processing Insights External Data: ' + extDataId);
        
        // PROCESS THE DATA
        extData = new InsightsExternalData();
        extData.Id = extDataId;
        extData.Action = 'Process';
    }
    
    
  public void execute(QueueableContext context) {
        update extData;
        
        // ==============================================
        //           Import done!
        // ==============================================
    }
}
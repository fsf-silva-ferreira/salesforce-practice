// DeployCallbackContext subclass for testing that returns myJobId.
public class TestingDeployCallbackContext extends Metadata.DeployCallbackContext {
    private Id myJobId = null; // Set to a fixed ID you can use for testing.
    
    public override Id getCallbackJobId() {
        return myJobId;
    }
}
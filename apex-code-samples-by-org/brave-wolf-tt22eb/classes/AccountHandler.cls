public class AccountHandler {

    public static Account insertNewAccount(String accountName) {
        Account acct;
        
        try {
    		acct = new Account(Name=accountName);  
            insert acct;
            
            return acct;
        } catch (DmlException e) {
            return null;
        }
    }
}
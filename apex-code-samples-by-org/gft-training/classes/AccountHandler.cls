public class AccountHandler {

    public static void insertAccount(Integer value) {
        Integer n = 1;        
        List<Account> addAccounts = new List<Account>();
        
        while(n <= value){
            //Display the current counter value
            System.debug('Counter Value before Incrementing ' + n);
            
            //Create a new account
            Account account = new Account();
            account.Name = 'Acme Inc ' + n;
            account.AccountNumber = 'A000' + n;
            addAccounts.add(account);
            System.debug(addAccounts);
            
            //Increment the counter
            n = n + 1;
            System.debug('Counter Value after incrementing ' + n);
        }
        
        System.debug('Size of Account List: ' + addAccounts.size() );
        System.debug('Elements in Account List: ' + addAccounts);
        
        //Insert all of the accounts in the list
        insert addAccounts;
    }
}
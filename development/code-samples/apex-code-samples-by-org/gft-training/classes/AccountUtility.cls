public class AccountUtility {

    public static void viewAnnualRevenue() {
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
        
        for (Account acc : accountsList){
            String acctRev = acc.Name + ' : ' + acc.AnnualRevenue;
            system.debug(acctRev);
        }
    }
}
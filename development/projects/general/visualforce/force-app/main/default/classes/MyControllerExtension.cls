/**
 * @description       : Building a controller extension.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-02-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class MyControllerExtension {

    private final Account acct;
    
    //* The extension constructor initializes the private member
    //* variable acct by using the getRecord method from the standard
    //* controller.
    public MyControllerExtension(ApexPages.StandardController stdController) {
        this.acct = (Account) stdController.getRecord();
    }

    public String getGreeting() {
        return 'Hello ' + acct.name + ' (' + acct.id + ')';
    }
}
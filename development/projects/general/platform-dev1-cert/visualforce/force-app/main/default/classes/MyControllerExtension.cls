/**
 * @description       : Building a controller extension.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-18-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class MyControllerExtension {

    private final Account account;
    
    //* The extension constructor initializes the private member
    //* variable acct by using the getRecord method from the standard
    //* controller.
    public MyControllerExtension(ApexPages.StandardController accountController) {
        this.account = (Account) accountController.getRecord();
    }

    public String getGreeting() {
        return 'Hello ' + acct.name + ' (' + acct.id + ')';
    }
}
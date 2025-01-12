/**
 * @description       : Managing a list of contacts.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-12-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class ContactsListWithController {

    private String sortOrder = 'LastName';

    public List<Contact> getContacts() {
        List<Contact> results = Database.query(
            'SELECT Id, FirstName, LastName, Title, Email ' +
            'FROM Contact ' +
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 10'
        );

        return results;
    }

    public void sortByLastName() {
        this.sortOrder = 'LastName';
    }

    public void sortByFirstName() {
        this.sortOrder = 'FirstName';
    }
}
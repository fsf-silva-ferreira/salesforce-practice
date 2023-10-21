import { LightningElement } from 'lwc';
import findContacts from '@salesforce/apex/ContactController.findContacts';

export default class ApexImperativeMethodWithParams extends LightningElement {

    //Page variables
    searchKey = '';
    contacts;
    error;


    //Getters
    get isContactsFound() {
        return this.contacts && this.contacts.length > 0;
    }

    get isContactsEmpty() {
        return this.contacts && this.contacts.length == 0;
    }


    //Event handlers
    handleKeyChange(event) {
        this.searchKey = event.target.value;
        this.setUndefinedToContactsIfSearchKeyEmpty();
    }

    
    //Custom logic
    async handleSearch() {
        try {
            this.contacts = await findContacts({ searchKey: this.searchKey });
            this.error = undefined;
        } catch (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }

    setUndefinedToContactsIfSearchKeyEmpty() {
        if(this.searchKey === '') {
            this.contacts = undefined;
        }
    }
}

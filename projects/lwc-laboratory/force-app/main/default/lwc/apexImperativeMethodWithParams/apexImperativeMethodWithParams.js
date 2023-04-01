/*
 * https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.apex_call_imperative
 * https://github.com/trailheadapps/lwc-recipes/tree/main/force-app/main/default/lwc/apexImperativeMethodWithParams
 */
import { LightningElement } from 'lwc';
import findContacts from '@salesforce/apex/ContactController.findContacts';

export default class ApexImperativeMethodWithParams extends LightningElement {
    
    searchKey = '';
    contacts;
    error;

    handleKeyChange(event) {
        this.searchKey = event.target.value;
    }

    handleSearch() {
        findContacts({ searchKey: this.searchKey })
            .then((result) => {
                if(result.length > 0) {
                    this.contacts = result;
                } else {
                    this.contacts = undefined;
                }

                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.contacts = undefined;
            });
    }
}
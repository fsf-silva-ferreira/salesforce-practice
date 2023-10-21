import { LightningElement, track } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';

export default class ApexImperativeMethod extends LightningElement {

    @track contacts;
    @track error;

    handleLoad() {
        getContactList()
            .then(result => {
                console.log('Result from Apex:', result);
                this.contacts = result;
            })
            .catch(error => {
                console.log('Erros from Apex:', result);
                this.error = error;
            });
    }
}
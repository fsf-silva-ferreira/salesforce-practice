import { LightningElement } from 'lwc';
import lookupZipCode from '@salesforce/apex/ApiCallExample.lookupZipCode';

export default class ApiRealData extends LightningElement {

    apiResponseBody;
    error;
    address;

    connectedCallback() {
        this.getZipCode();
    }

    getZipCode() {
        lookupZipCode()
            .then(result => {
                this.apiResponseBody = JSON.parse(result.responseBody);
                console.log('apiResponseBody:', this.apiResponseBody);
                this.address = this.apiResponseBody.cep + ' ' + this.apiResponseBody.logradouro;
            })
            .catch(error => {
                this.error = error;
            })
    }
}
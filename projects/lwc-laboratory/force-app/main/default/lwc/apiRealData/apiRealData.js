import { LightningElement } from 'lwc';
import getZipCode from '@salesforce/apex/ApiCallExample.lookupZipCode';

export default class ApiRealData extends LightningElement {

    apiResponseBody;
    error;
    address;

    connectedCallback() {
        getZipCode();
    }

    getZipCode() {
        lookupZipCode()
            .then(result => {
                this.apiResponseBody = JSON.parse(result.responseBody);
                this.address = this.apiResponseBody.cep + ' ' + this.apiResponseBody.logradouro;
            })
            .catch(error => {
                this.error = error;
            })
    }
}
import { LightningElement } from 'lwc';
import lookupAddressByZip from '@salesforce/apex/ApiCallExample.lookupAddressByZip';

export default class ApiRealData extends LightningElement {

    zipCode;
    apiResponseBody;
    error;
    address;

    getAddress() {
        lookupAddressByZip()
            .then(result => {
                this.apiResponseBody = JSON.parse(result.responseBody);

                console.log('apiResponseBody:', this.apiResponseBody);

                this.address = this.apiResponseBody.cep + ' - ' + this.apiResponseBody.logradouro + ' - ' +
                    this.apiResponseBody.localidade + ' (' + this.apiResponseBody.uf + ')';
            })
            .catch(error => {
                this.error = error;
            })
    }
}
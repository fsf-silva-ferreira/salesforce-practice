import { LightningElement } from 'lwc';
import LightningAlert from 'lightning/alert';
import lookupAddressByZip from '@salesforce/apex/ApiCallExample.lookupAddressByZip';

export default class ApiRealData extends LightningElement {

    zipCode;
    //zipCodeInput
    apiResponseBody;
    error;
    address;

    //Event handlers
    handleKeyChange(event) {
        this.zipCode = event.target.value;
    }

    async handleButtonClick() {
         this.address = '';

        if(this.zipCode) {
            this.getAddress();    
        } else {
            await LightningAlert.open({
                message: 'Zip code required.',
                theme: 'warning',
                label: 'Field Required',
            });
        }
    }

    handleOnloadEvent() {
        zipCodeInput = this.template.querySelector('lightning-input');
        zipCodeInput.focus();
    }

    //Custom logic
    getAddress() {
        lookupAddressByZip
        (
            {
                zipCode: this.zipCode
            }
        )
            .then(result => {
                this.apiResponseBody = JSON.parse(result.responseBody);

                console.log('apiResponseBody:', this.apiResponseBody);

                var logradouro = this.apiResponseBody.logradouro ? ' - ' + this.apiResponseBody.logradouro : '';
                this.address = this.apiResponseBody.cep + logradouro + ' - ' + this.apiResponseBody.localidade + 
                    ' (' + this.apiResponseBody.uf + ')';
            })
            .catch(error => {
                this.error = error;
            })
    }
}
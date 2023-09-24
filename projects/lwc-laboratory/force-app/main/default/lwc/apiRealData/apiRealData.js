import { LightningElement } from 'lwc';
import LightningAlert from 'lightning/alert';
import lookupAddressByZip from '@salesforce/apex/ApiCallExample.lookupAddressByZip';

export default class ApiRealData extends LightningElement {

    zipCode;
    apiResponseBody;
    error;
    address;

    //Event handlers
    handleKeyChange(event) {
        this.zipCode = event.target.value;
    }

    handleButtonClick() {
        this.address = '';

        var requiredFilled = this.checkRequired();
        if(requiredFilled) {
            this.checkLength();
        }
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
                if(result.httpCode == 200) {
                    this.apiResponseBody = JSON.parse(result.responseBody);

                    console.log('apiResponseBody:', this.apiResponseBody);

                    if(this.apiResponseBody.cep) {
                        var logradouro = this.apiResponseBody.logradouro ? ' - ' + this.apiResponseBody.logradouro : '';
                        this.address = this.apiResponseBody.cep + logradouro + ' - ' + this.apiResponseBody.localidade + 
                            ' (' + this.apiResponseBody.uf + ')';
                    }

                    if(this.apiResponseBody.erro) {
                        this.address = 'ZIP invalid or not found.'
                    }
                } else
                if(result.httpCode == 400) {
                    this.address = 'ZIP invalid or not found.'
                } else {
                    throw new Error();
                }
            })
            .catch(error => {
                this.error = error;
            })
    }

    checkRequired() {
        if(!this.zipCode) {
            LightningAlert.open({
                message: 'Zip code required.',
                theme: 'warning',
                label: 'Field Required',
            });

            return false;   
        } else {            
            return true;
        }    
    }

    checkLength() {
        if(this.zipCode.length == 8) {
            this.getAddress();    
        } else {
            LightningAlert.open({
                message: 'ZIP code must be 8 digits long.',
                theme: 'warning',
                label: 'Field Length',
            });
        }    
    }
}
/**
    * @description      : 
    * @author           : fodf
    * @group            : 
    * @created          : 09/09/2021 - 15:33:33
    * 
    * MODIFICATION LOG
    * - Version         : 1.0.0
    * - Date            : 09/09/2021
    * - Author          : fodf
    * - Modification    : 
**/
import { LightningElement } from 'lwc';
import getConsultaCep from '@salesforce/apex/BuscaCepController.buscaCep'

export default class Devapi extends LightningElement {

    codigoCep = '0909090909';
    result;
    error;

    handleOnChangeCep(event) {
        let cep = event.target.value;
        this.codigoCep = cep;
    }

    handleClickBuscaCep() {
        console.log('Entrou click');

        consultaCep({ codigoCep: this.codigoCep })
            //JavaScript promise
            .then(result => {
                console.log('Entrou then');
                this.result = res;
                
            })
            .catch(error => {
                this.error = error;
            });
    }
}
/**
    * @description      : 
    * @author           : Flávio Ferreira
    * @group            : 
    * @created          : 08/12/2021 - 09:57:39
    * 
    * MODIFICATION LOG
    * - Version         : 1.0.0
    * - Date            : 08/12/2021
    * - Author          : fodf
    * - Modification    : 
**/
import { LightningElement } from 'lwc';
import getAnimal from '@salesforce/apex/AdocaoPetController.getAnimal';

export default class AdocaoPet extends LightningElement {

    lstPets = [];

    handleSave(){
        console.log('handleSave');

        this.lstPets.push( { nomePET : this.template.querySelector("[data-id='nomePET']").value,
                            codigoPET : this.template.querySelector("[data-id='codigoPET']").value,
                            email : this.template.querySelector("[data-id='email']").value,
                            preferenciaTipoPET : this.template.querySelector("[data-id='preferenciaTipoPET']").value,
                            portePET : this.template.querySelector("[data-id='portePET']").value
                        } );

        console.log(this.lstPets);

        this.template.querySelector('c-detalhes-pet').updateDataTable(JSON.stringify(this.lstPets));
    }

    handleClear(){
        console.log('handleClear');

        this.template.querySelector("[data-id='nomePET']").value = '';
        this.template.querySelector("[data-id='codigoPET']").value = '';
        this.template.querySelector("[data-id='email']").value = '';
        this.template.querySelector("[data-id='preferenciaTipoPET']").value = '';
        this.template.querySelector("[data-id='portePET']").value = '';
    }

    get options() {
        return [
            {label : 'Cat', value : 'Cat'},
            {label : 'Dog', value : 'Dog'}
        ]
    }

    get porte() {
        return [
            {label : 'Pequeno', value : 'Pequeno'},
            {label : 'Médio', value : 'Medio'},
            {label : 'Grande', value : 'Grande'}
        ]
    }
}
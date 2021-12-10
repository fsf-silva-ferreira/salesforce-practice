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
import { createRecord } from 'lightning/uiRecordApi';

import ANIMAL_OBJECT from '@salesforce/schema/Animal__c';
import NAME_FIELD from '@salesforce/schema/Animal__c.name';
import TIPO_FIELD from '@salesforce/schema/Animal__c.tipo__c';
import EMAIL_FIELD from '@salesforce/schema/Animal__c.email__c';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AdocaoPet extends LightningElement {

    lstPets = [];

    handleSave(){
        console.log('handleSave');

        this.lstPets.push( { nomePET : this.template.querySelector("[data-id='nomePET']").value,
                            /*
                            codigoPET : this.template.querySelector("[data-id='codigoPET']").value,
                            */
                            email : this.template.querySelector("[data-id='emailSolicitante']").value,
                            preferenciaTipoPET : this.template.querySelector("[data-id='preferenciaTipoPET']").value,
                            portePET : this.template.querySelector("[data-id='portePET']").value
                        } );

        console.log(this.lstPets);

        this.template.querySelector('c-detalhes-pet').updateDataTable(JSON.stringify(this.lstPets));

        this.insertRecord();
    }

    insertRecord(){
        const fields = {};
        fields[NAME_FIELD.fieldApiName] = this.template.querySelector("[data-id='nomePET']").value;
        fields[TIPO_FIELD.fieldApiName] = this.template.querySelector("[data-id='preferenciaTipoPET']").value;
        fields[EMAIL_FIELD.fieldApiName] = this.template.querySelector("[data-id='emailSolicitante']").value;

        const recordInput = { apiName: ANIMAL_OBJECT.objectApiName, fields };

        let newRecordId;

        createRecord(recordInput)
            .then(animal => {
                newRecordId = animal.id;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'PET gravado com sucesso.',
                        variant: 'success'
                    }),
                );
            });
    }

    handleClear(){
        console.log('handleClear');

        this.template.querySelector("[data-id='nomePET']").value = '';
        this.template.querySelector("[data-id='codigoPET']").value = '';
        this.template.querySelector("[data-id='email']").value = '';
        this.template.querySelector("[data-id='preferenciaTipoPET']").value = null;
        this.template.querySelector("[data-id='portePET']").value = null;
    }

    get options() {
        return [
            {label : 'Gato', value : 'Gato'},
            {label : 'Cachorro', value : 'Cachorro'}
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
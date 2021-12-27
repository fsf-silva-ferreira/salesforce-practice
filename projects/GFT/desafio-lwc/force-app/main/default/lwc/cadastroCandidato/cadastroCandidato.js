/**
    * @description      : 
    * @author           : fodf
    * @group            : 
    * @created          : 10/12/2021 - 17:39:50
    * 
    * MODIFICATION LOG
    * - Version         : 1.0.0
    * - Date            : 10/12/2021
    * - Author          : fodf
    * - Modification    : 
**/
import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

import CANDIDATO_OBJECT from '@salesforce/schema/Candidato__c';
import NAME_FIELD from '@salesforce/schema/Candidato__c.name';
import SEXO_FIELD from '@salesforce/schema/Candidato__c.sexo__c';
import CARGO_FIELD from '@salesforce/schema/Candidato__c.cargo__c';
import CPF_FIELD from '@salesforce/schema/Candidato__c.cpf__c';
import FONE_FIELD from '@salesforce/schema/Candidato__c.telefone__c';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CadastroCandidato extends LightningElement {

    lstCandidatos = [];

    handleSave(){
        console.log('handleSave');

        this.lstCandidatos.push( { 
            nomeCandidato : this.template.querySelector("[data-id='nomeCandidato']").value,
            cargoCandidato : this.template.querySelector("[data-id='cargoCandidato']").value,
            sexoCandidato : this.template.querySelector("[data-id='sexoCandidato']").value, 
            cpfCandidato : this.template.querySelector("[data-id='cpfCandidato']").value,
            foneCandidato : this.template.querySelector("[data-id='foneCandidato']").value           
        } );

        console.log(this.lstCandidatos);

        this.template.querySelector('c-dados-candidato').updateDataTable(JSON.stringify(this.lstCandidatos));

        this.insertRecord();
    }

    insertRecord(){
        const fields = {};
        fields[NAME_FIELD.fieldApiName] = this.template.querySelector("[data-id='nomeCandidato']").value;
        fields[SEXO_FIELD.fieldApiName] = this.template.querySelector("[data-id='sexoCandidato']").value;
        fields[CARGO_FIELD.fieldApiName] = this.template.querySelector("[data-id='cargoCandidato']").value;
        fields[CPF_FIELD.fieldApiName] = this.template.querySelector("[data-id='cpfCandidato']").value;
        fields[FONE_FIELD.fieldApiName] = this.template.querySelector("[data-id='foneCandidato']").value;

        const recordInput = { apiName: CANDIDATO_OBJECT.objectApiName, fields };

        let newRecordId;

        createRecord(recordInput)
            .then(candidato => {
                newRecordId = candidato.id;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Candidato confirmado com sucesso.',
                        variant: 'success'
                    }),
                );
            });
    }

    handleClear(){
        console.log('handleClear');

        this.template.querySelector("[data-id='nomeCandidato']").value = '';
        this.template.querySelector("[data-id='sexoCandidato']").value = null;
        this.template.querySelector("[data-id='cargoCandidato']").value = ''; 
        this.template.querySelector("[data-id='cpfCandidato']").value = '';   
        this.template.querySelector("[data-id='foneCandidato']").value = '';              
    }

    handleMaskCPF(event) {
        const x = event.target.value
            .replace(/\D+/g, '')
            .match(/(\d{0,3})(\d{0,3})(\d{0,3})(\d{0,2})/);
        event.target.value =
            `${x[1]}` + (x[2] ? `.${x[2]}` : ``) + (x[3] ? `.${x[3]}` : ``) + (x[4] ? `-${x[4]}` : ``);
    }

    handleMaskTelefone(event) {
        const x = event.target.value
            .replace(/\D+/g, '')
            .match(/(\d{0,2})(\d{0,5})(\d{0,4})/);
        event.target.value =
            !x[2] ? x[1] : `(${x[1]}) ${x[2]}` + (x[3] ? `-${x[3]}` : ``);
    }

    get options() {
        return [
            {label : 'Masculino', value : 'Masculino'},
            {label : 'Feminino', value : 'Feminino'}
        ]
    }
}
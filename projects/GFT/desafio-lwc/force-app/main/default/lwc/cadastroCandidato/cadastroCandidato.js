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

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CadastroCandidato extends LightningElement {

    lstCandidatos = [];

    handleSave(){
        console.log('handleSave');

        this.lstCandidatos.push( { 
            nomeCandidato : this.template.querySelector("[data-id='nomeCandidato']").value,
            sexoCandidato : this.template.querySelector("[data-id='sexoCandidato']").value,
            cargoCandidato : this.template.querySelector("[data-id='cargoCandidato']").value
        } );

        console.log(this.lstCandidatos);

        this.template.querySelector('c-dados-candidato').updateDataTable(JSON.stringify(this.lstCandidatos));

        //this.insertRecord();
    }

    handleClear(){
        console.log('handleClear');

        this.template.querySelector("[data-id='nomeCandidato']").value = '';
        this.template.querySelector("[data-id='sexoCandidato']").value = null;
        this.template.querySelector("[data-id='cargoCandidato']").value = '';                
    }

    get options() {
        return [
            {label : 'Masculino', value : 'Masculino'},
            {label : 'Feminino', value : 'Feminino'}
        ]
    }
}
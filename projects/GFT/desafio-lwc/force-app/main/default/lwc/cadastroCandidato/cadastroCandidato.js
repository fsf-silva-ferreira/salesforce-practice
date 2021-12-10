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

export default class CadastroCandidato extends LightningElement {}
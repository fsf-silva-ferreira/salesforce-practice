import { LightningElement } from 'lwc';
import getZipCode from '@salesforce/apex/ApiCallExample.lookupZipCode';

export default class ApiRealData extends LightningElement {

    apiResponse;

    connectedCallback() {
    
    }
}
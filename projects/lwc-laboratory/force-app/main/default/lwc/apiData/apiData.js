import { LightningElement } from 'lwc';
import callApiSuccessResponseTrue from '@salesforce/apex/ApiCallExample.callApiSuccessResponseTrue';
import callApiSuccessResponseFalse from '@salesforce/apex/ApiCallExample.callApiSuccessResponseFalse';
import callApiErrorResponse from '@salesforce/apex/ApiCallExample.callApiErrorResponse';

export default class ApiData extends LightningElement {

    user;
    error;

    connectedCallback() {
    }
    
    callSuccessTrue() {
        callApiSuccessResponseTrue()
			.then(result => {

			})
			.catch(error => {

			})
    }

    callSuccessFalse() {
        callApiSuccessResponseFalse()
			.then(result => {

			})
			.catch(error => {

			})
    }

    callSuccessError() {
        callApiErrorResponse()
			.then(result => {

			})
			.catch(error => {

			})
    }
}
import { LightningElement, api, track } from 'lwc';
import callApiSuccessResponseTrue from '@salesforce/apex/ApiCallExample.callApiSuccessResponseTrue';
import callApiSuccessResponseFalse from '@salesforce/apex/ApiCallExample.callApiSuccessResponseFalse';
import callApiErrorResponse from '@salesforce/apex/ApiCallExample.callApiErrorResponse';

export default class ApiData extends LightningElement {

    // User data
    userName;
    userEmail;
    userPhone;

    // Mocked API response data
    responseBody;

    // Error data
    http500ErrorMessage;
    apiErrorMessage;
    error;

    connectedCallback() {
        this.callSuccessTrue();
        this.callSuccessFalse();
        this.callSuccessError();
    }
    
    callSuccessTrue() {
        let user;

        callApiSuccessResponseTrue()
			.then(result => {
                this.responseBody = JSON.parse(result.responseBody);
                user = this.responseBody.data.user;

                this.userName = user.name;
                this.userEmail = user.email;
                this.userPhone = user.mobile;
			})
			.catch(error => {
                this.error = error;
			})
    }

    callSuccessFalse() {
        callApiSuccessResponseFalse()
			.then(result => {
                this.responseBody = JSON.parse(result.responseBody);
                this.apiErrorMessage = this.responseBody.message;
			})
			.catch(error => {
                this.error = error;
			})
    }

    callSuccessError() {
        callApiErrorResponse()
			.then(result => {
                this.responseBody = JSON.parse(result.responseBody);
                this.http500ErrorMessage = this.responseBody.error;
			})
			.catch(error => {
                this.error = error;
			})
    }
}
import { api, LightningElement } from 'lwc';
import getHelloMessage from '@salesforce/apex/BackendController.getHelloMessage';

export default class ApexCall extends LightningElement {

    @api
    helloMessage;
	error;

	connectedCallback() {
        this.setHelloMessage();
    }

	/*
	 * Call Apex Methods Imperatively
	 * https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.apex_call_imperative 
	 */
    setHelloMessage() {
        getHelloMessage()
			.then(result => {
				this.helloMessage = result;
				this.error = undefined;
			})
			.catch(error => {
				this.error = error;
				this.helloMessage = undefined;
			})
    }
}
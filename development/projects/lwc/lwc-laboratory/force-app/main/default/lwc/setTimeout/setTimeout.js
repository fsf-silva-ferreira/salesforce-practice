import { api, LightningElement } from 'lwc';

export default class SetTimeout extends LightningElement {

    @api
    timeoutMessage = "Waiting for 5 seconds ...";
    
    connectedCallback() {
        const myTimeout = setTimeout
        (
            () => 
            {
                console.log('this.setTimeoutMessage: ' + this.timeoutMessage);
                this.timeoutMessage = "Done!";
                console.log('this.setTimeoutMessage: ' + this.timeoutMessage);
            }, 
            5000
        );  
    }
}
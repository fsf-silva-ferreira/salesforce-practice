import { LightningElement } from 'lwc';

export default class EventCommParentHtml extends LightningElement {

    //*Property reactive by default, @track decorator no more needed
    message;

    
    //*Handling event from child
    handleCustomEvent(event) {
        this.message = event.detail;
    }
}
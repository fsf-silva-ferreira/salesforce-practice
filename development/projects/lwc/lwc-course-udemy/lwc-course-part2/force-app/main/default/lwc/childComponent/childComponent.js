import { LightningElement, api } from 'lwc';

export default class ChildComponent extends LightningElement {

    //Message sent from parent
    message;

    @api
    changeMessage(messageFromParent) {
        this.message = messageFromParent.toUpperCase();
    }
}
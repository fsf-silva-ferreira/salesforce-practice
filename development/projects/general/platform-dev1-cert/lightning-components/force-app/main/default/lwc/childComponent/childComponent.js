import { LightningElement, api } from 'lwc';

export default class ChildComponent extends LightningElement {

    message;

    @api //In this example the method is public, and then visible for parent to pass in data
    changeMessage(stringParam) {
        this.message = stringParam.toUpperCase();
    }
}
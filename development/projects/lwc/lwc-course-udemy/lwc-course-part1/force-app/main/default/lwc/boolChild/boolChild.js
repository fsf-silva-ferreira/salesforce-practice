import { LightningElement, api } from 'lwc';

export default class BoolChild extends LightningElement {

    @api
    show = false;

    constructor() {
        super()
        console.log('Constructor on the child is called');
    }

    connectedCallback() {
        console.log('Connected callback on the child is called');
    }

    renderedCallback() {
        console.log('Rendered callback on the child is called');
    }

    disconnectedCallback() {
        console.log('Disconnected call back on the child is called')  ;  
    }
}
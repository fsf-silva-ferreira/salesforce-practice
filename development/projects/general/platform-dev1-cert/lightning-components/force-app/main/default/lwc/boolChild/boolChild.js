import { LightningElement, api } from 'lwc';

export default class BoolChild extends LightningElement {

    //*Public property to be set by parent
    @api show;


    //*Lifecycle Hooks methods
    constructor() {
        super();
        console.log('Constructor on the child is called');    
    }

    connectedCallback() {
        console.log('Connected callback on the child is called');
    }

    renderedCallback() {
        console.log('Rendered callback on the child is called ');
    }

    disconnectedCallback() {
        console.log('Disconnected callback on the child is called');
    }
}
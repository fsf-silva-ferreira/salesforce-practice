import { LightningElement } from 'lwc';

export default class BoolParent extends LightningElement {

    //*Data sent to child component
    sampleData = true;


    //*Lifecycle Hooks methods
    constructor() {
        super();
        console.log('Constructor on the parent is called');    
    }

    connectedCallback(){
        console.log('Connected callback on the parent is called');
    }

    renderedCallback() {
        console.log('Rendered callback on the parent is called ');
    }

    disconnectedCallback(){
        console.log('Disconnected callback on the parent is called');
    }
}
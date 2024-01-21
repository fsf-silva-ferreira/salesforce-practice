import { LightningElement } from 'lwc';

export default class BoolParent extends LightningElement {

    constructor() {
        super();
        console.log('Constructor on the parent is called');
    }

    connectedCallback() {
        console.log('Callback on the parent is called');
    }

    renderedCallback() {
        console.log('Rendered callback on the parent is called');
    }

    disconnectedCallback() {
        console.log('Disconnected callback on the parent is called');
    }
}
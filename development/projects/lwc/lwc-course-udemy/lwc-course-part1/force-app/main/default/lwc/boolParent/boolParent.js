import { LightningElement, api } from 'lwc';

export default class BoolParent extends LightningElement {

    //Boolean public property must default to false
    @api
    show = false;

    handleShowHide() {
        this.show = !this.show;
    }

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
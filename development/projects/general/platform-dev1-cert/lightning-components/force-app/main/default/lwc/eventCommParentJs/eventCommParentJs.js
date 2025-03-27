import { LightningElement } from 'lwc';

export default class EventCommParentHtml extends LightningElement {

    //*Property reactive by default, @track decorator no more needed
    message;

    constructor() {
        super();
        this.template.addEventListener('mycustomevent', this.handleCustomEvent.bind(this));
    }
    
    //*Handling event from child
    handleCustomEvent(event) {
        this.message = event.detail;
    }
}
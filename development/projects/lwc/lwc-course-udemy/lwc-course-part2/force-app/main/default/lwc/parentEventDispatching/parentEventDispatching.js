import { LightningElement, track } from 'lwc';

export default class ParentEventDispatching extends LightningElement {

    messageSentFromChild;

    //Component lifecycle method
    constructor() {
        super();
        this.template.addEventListener('mycustomevent', this.handleCustomEvent.bind(this));
    }

    //Event handler
    handleCustomEvent(event) {
        this.messageSentFromChild = event.detail;
    }
}
import { LightningElement } from 'lwc';

export default class EventCommChild extends LightningElement {

    handleInputTextChange(event) {        
        const name = event.target.value;
        const myCustomEvent = new CustomEvent('mycustomevent', {detail : name});
        this.dispatchEvent(myCustomEvent);
    }
}
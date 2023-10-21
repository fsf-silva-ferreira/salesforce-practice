import { LightningElement } from "lwc";

export default class Paginator extends LightningElement {

    previousHandler() {
        const previousHandlerEvent = new CustomEvent('previous');
        this.dispatchEvent(previousHandlerEvent);
        console.log('Previous Handler Event:', previousHandlerEvent);
    }

    nextHandler() {
        const nextHandlerEvent = new CustomEvent('next');
        this.dispatchEvent(nextHandlerEvent);
        console.log('Next Handler Event:', nextHandlerEvent);
    }
}
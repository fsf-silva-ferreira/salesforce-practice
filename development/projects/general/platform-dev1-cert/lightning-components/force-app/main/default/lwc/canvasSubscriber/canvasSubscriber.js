import { LightningElement, wire } from 'lwc';
import { registerListener, unregisterAllListeners } from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation'

export default class CanvasSubscriber extends LightningElement {

    color;
    @wire(CurrentPageReference) pageRef;


    connectedCallback() {
        registerListener('changedColor', this.handleChangedColor, this);
    }

    disconnectedCallback() {
        unregisterAllListeners(this);
    }

    handleChangedColor(colorCode) {
        this.color = colorCode;
    }

    get colorStyle() {
        return `background-color:${this.color}`;
    }
}
import { LightningElement, wire } from 'lwc';
import { registerListener, unregisterListener } from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';
import { unregisterAllListeners } from 'c/pubsub';


export default class CanvasSubscriber extends LightningElement {

    colorSelectedFromPalette;

    @wire(CurrentPageReference)
    pageRef;

    connectedCallback() {
        registerListener('colorChanged', this.handleColorChanged, this);
    }

    disconnectedCallback() {
        unregisterAllListeners(this);
    }

    handleColorChanged(colorCode) {
        this.colorSelectedFromPalette = colorCode;
        console.log('Color changed to canvas ' + colorCode);        
    }

    get colorStyle() {
        return `background-color:${this.colorSelectedFromPalette}`;
    }
}
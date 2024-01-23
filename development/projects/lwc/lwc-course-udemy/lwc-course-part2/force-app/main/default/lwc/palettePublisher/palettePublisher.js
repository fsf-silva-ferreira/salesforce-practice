import { LightningElement, wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';


export default class PalettePublisher extends LightningElement {

    colorSelectedToCanvas;

    colorCodeOptions = 
    [
        {
            label: "Green",
            value: "green"
        },
        {
            label: "Red",
            value: "red"
        },
        {
            label: "Yellow",
            value: "yellow"
        },
        {
            label: "Blue",
            value: "blue"
        }
    ]

    @wire(CurrentPageReference)
    pageRef;

    handleColorSelected(event) {
        this.colorSelectedToCanvas = event.target.value;
    }

    handleColorChanged() {
        console.log('Color changed from palette ' + this.colorSelectedToCanvas);
        fireEvent(this.pageRef, 'colorChanged', this.colorSelectedToCanvas);
    }
}
import { LightningElement, wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';


const colorCodeOptions = 
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

export default class PalettePublisher extends LightningElement {

    //Palette properties
    colorSelectedToCanvas;
    colorOptions = colorCodeOptions;

    //Used for pub-sub communication
    @wire(CurrentPageReference)
    pageRef;

    //Event handlers
    handleColorSelected(event) {
        this.colorSelectedToCanvas = event.target.value;
    }

    handleColorChanged() {
        console.log('Color changed from palette ' + this.colorSelectedToCanvas);
        fireEvent(this.pageRef, 'colorChanged', this.colorSelectedToCanvas);
    }
}
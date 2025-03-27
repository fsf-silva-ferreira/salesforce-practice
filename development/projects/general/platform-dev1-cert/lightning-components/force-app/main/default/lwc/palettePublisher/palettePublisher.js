import { LightningElement, wire } from 'lwc';
import {fireEvent} from 'c/pubsub'
import {CurrentPageReference} from 'lightning/navigation'

export default class PalettePublisher extends LightningElement {

    color;
    @wire(CurrentPageReference) pageRef;
    colorCodeOptions = [
        {label: "Green", value: "green"},
        {label: "Red", value: "red"},
        {label: "Yellow", value: "yellow"},
        {label: "Blue", value: "blue"}
    ];


    changeColor(event) {
        this.color = event.target.value;        
    }

    handleChangeColor() {        
        fireEvent(this.pageRef, "changedColor", this.color);
    }

}
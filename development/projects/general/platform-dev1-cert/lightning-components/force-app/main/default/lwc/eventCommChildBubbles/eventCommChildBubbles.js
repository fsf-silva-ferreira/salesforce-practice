import { LightningElement } from 'lwc';

export default class EventCommChildBubbles extends LightningElement {

    //*We describe this by saying that the event bubbles up from the innermost element that was clicked.
    handleInputTextChange(event) {        
        const name = event.target.value;
        const bubblingEventOption = {detail : name, 'bubbles' : true};
        const bubblingCustomEvent = new CustomEvent('mycustomevent', bubblingEventOption); 

        this.dispatchEvent(bubblingCustomEvent);
    }
}
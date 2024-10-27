import { LightningElement } from 'lwc';

export default class Publisher extends LightningElement {

    handleClick() {
        let event = new CustomEvent('message', {
            detail: {
                value: 'Event Message'
            },
            bubbles: true
        });

        this.dispatchEvent(event);
    }
}
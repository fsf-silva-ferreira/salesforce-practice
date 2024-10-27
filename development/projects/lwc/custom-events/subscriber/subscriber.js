import { LightningElement } from 'lwc';

export default class Subscriber extends LightningElement {

    connectedCallback() {
        window.addEventListener('messsage', this.handleMessage, false);
    }

    handleMessage = (event) => {
        let detail = event.detail.value;
        alert(`${detail} has been received`);
    }

    disconnectedCallback() {
        window.removeEventListener('message', this.handleMessage, false);
    }
}
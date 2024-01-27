import { LightningElement } from 'lwc';


export default class CreateContactEditView extends LightningElement {

    recordId;

    createContact(event) {
        this.recordId = event.detail.id;
    }
}
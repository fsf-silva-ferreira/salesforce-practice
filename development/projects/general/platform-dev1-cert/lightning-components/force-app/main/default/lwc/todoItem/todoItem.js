import { LightningElement, api } from 'lwc';

export default class TodoItem extends LightningElement {

    //*Public property to be set by parent component
    @api itemName;
}
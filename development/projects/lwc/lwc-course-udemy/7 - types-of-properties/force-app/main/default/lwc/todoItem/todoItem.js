import { LightningElement, api } from 'lwc';

export default class TodoItem extends LightningElement {

    //Public property, data is passed in from parent
    @api
    itemName = 'New Item';
}
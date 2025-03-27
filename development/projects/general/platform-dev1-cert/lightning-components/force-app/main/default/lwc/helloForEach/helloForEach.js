import { LightningElement } from 'lwc';

export default class HelloForEach extends LightningElement {

    contacts = [
        {Id:1, Name: 'Amy Taylor', Title: 'VP of Engeneering'},
        {Id:2, Name: 'Michael Jones', Title: 'VP of Sales'},
        {Id:3, Name: 'Jenifer Wu', Title: 'CEO'}
    ];
}
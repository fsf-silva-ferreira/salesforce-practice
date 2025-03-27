import { LightningElement } from 'lwc';

export default class HelloIterator extends LightningElement {

    contacts = [
        {Id:1, Name: 'Amy Taylor', Title: 'VP of Engeneering'},
        {Id:2, Name: 'Michael Jones', Title: 'VP of Sales'},
        {Id:3, Name: 'Jenifer Wu', Title: 'CEO'},
        {Id:4, Name: 'Jenifer Anniston', Title: 'VP of Marketing'},
        {Id:5, Name: 'Flávio Ferreira', Title: 'Software Developer'}
    ];
}
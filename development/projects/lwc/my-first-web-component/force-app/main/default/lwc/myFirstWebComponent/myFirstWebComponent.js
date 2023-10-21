import { LightningElement, track } from 'lwc';
export default class HelloIteration extends LightningElement {
    @track
    contacts = [
        {
            Id: 1,
            Name: 'Luciene Almeida',
            Title: 'VP of Engineering',
        },
        {
            Id: 2,
            Name: 'Gustavo Almeida',
            Title: 'VP of Sales',
        },
        {
            Id: 3,
            Name: 'Flávio Ferreira',
            Title: 'CEO',
        },
    ];
}
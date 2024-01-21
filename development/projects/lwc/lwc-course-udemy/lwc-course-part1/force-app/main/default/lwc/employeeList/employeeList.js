import { LightningElement } from 'lwc';

export default class EmployeeList extends LightningElement {

    employees = 
    [
        {
            name: 'Steve',
            address: 'NC'
        },
        {
            name: 'Smith',
            address: 'TX'
        },
        {
            name: 'Rodger',
            address: 'LA'
        },
        {
            name: 'John',
            address: 'SC'
        },
        {
            name: 'Raymond',
            address: 'Washington DC'
        }
    ];
}
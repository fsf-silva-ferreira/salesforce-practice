import { LightningElement } from 'lwc';

export default class EmployeeList extends LightningElement {
    //*List of employees to be set to child component
    employeeList = [
        {name : 'Steve', address : 'NC'},
        {name : 'Smith', address : 'TX'},
        {name : 'Rodgers', address : 'LA'},
        {name : 'John', address : 'SC'},
        {name : 'Raymond', address : 'Washington, DC'}
    ];
}
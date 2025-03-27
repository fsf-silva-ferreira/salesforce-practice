import { LightningElement, api } from 'lwc';

export default class EmployeeDetail extends LightningElement {
    @api employee; //Public property to receive data from parent
}
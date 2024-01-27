import { LightningElement } from 'lwc';

export default class EmployeeDetailExample extends LightningElement {

    //Properties - Trackable by default, @trackable decorator no more need
    name;
    age;
    salary;


    //Event handlers
    nameHandler(event) {
        this.name = event.target.value;
    }

    ageHandler(event) {
        this.age = event.target.value;
    }

    salaryHandler(event) {
        this.salary = event.target.value;
    }
}
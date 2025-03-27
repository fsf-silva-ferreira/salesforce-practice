import { LightningElement } from 'lwc';

export default class EmployeeInfo extends LightningElement {

    show = true;

    name;
    age;
    salary;


    nameHandler(event) {
        this.name = event.target.value;
    }

    ageHandler(event) {
        this.age = event.target.value;
    }

    salaryHandler(event) {
        this.salary = event.target.value;
    }

    saveButtonHandler() {
        this.show = false;
    }
}
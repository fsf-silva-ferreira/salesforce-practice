import { LightningElement } from 'lwc';

export default class EmployeeInfo extends LightningElement {

    //Employee properties
    name;
    age;
    salary;

    //Property controlling data visibility
    show = true;


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

    saveButtonHandler() {
        this.show = false;
    }
}
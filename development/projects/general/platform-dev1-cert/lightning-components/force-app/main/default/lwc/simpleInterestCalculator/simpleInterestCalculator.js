import { LightningElement } from 'lwc';

export default class SimpleInterestCalculator extends LightningElement {

    //*Outcome property
    currentOutput;

    //*Input properties
    principal;
    rateOfInterest;
    numberOfYears;


    //*Handler methods
    principalChangeHandler(event) {
        this.principal = parseInt(event.target.value);
    }

    timeChangeHandler(event) {
        this.numberOfYears = parseInt(event.target.value);
    }

    rateChangeHandler(event) {
        this.rateOfInterest = parseInt(event.target.value);
    }

    calculateSiHandler() {
        this.currentOutput = 'Simples Interest is: ' + (this.principal*this.rateOfInterest*this.numberOfYears)/100;
    }
}
import { LightningElement } from 'lwc';

export default class Augmentor extends LightningElement {

    startCounter = 0;
    
    handleStartChange(event) {
      this.startCounter = parseInt(event.target.value);
    }

    /*
      This function finds the c-numerator tag in augmentor.html and calls the public 
      maximizeCounter function.
    */
    handleMaximizeCounter() {
      this.template.querySelector('c-numerator').maximizeCounter();
    }
}
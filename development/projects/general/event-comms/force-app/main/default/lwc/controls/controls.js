import { LightningElement } from 'lwc';

export default class Controls extends LightningElement {

    factors = [0,2,3,4,5,6];
    
    handleAdd() {
        this.dispatchEvent(new CustomEvent('add'));
    }

    handleSubtract() {
        this.dispatchEvent(new CustomEvent('subtract'));
    }

    /*
        Notice we pass the onclick event to the handleMultiply function, which gets the button 
        data-factor through the event.target.dataset.factor. 

        Then we pass the factor along with the new custom event (multiply) to the parent 
        component (numerator).
    */
    handleMultiply(event) {
        const factor = event.target.dataset.factor;
        this.dispatchEvent(new CustomEvent('multiply', {
            detail: factor
        }));
    }
}
import { LightningElement,api } from 'lwc';

export default class Numerator extends LightningElement {
    /*
      @api
      counter = 0;
    */

    /*
      This code changes counter to a property with getter (get) and setter (set) functions. 
      
      It also adds the priorCount and _currentCount properties.
    */
    _currentCount = 0;
    priorCount = 0;
    @api
    get counter() {
      return this._currentCount;
    }
    set counter(value) {
      this.priorCount = this._currentCount;
      this._currentCount = value;
    }

    handleIncrement() {
      this.counter++;
    }
    
    handleDecrement() {
      this.counter--;
    }

    /*
      Here the handleMultiply function gets the onmultiply event passed in and uses its data 
      (event.detail) to update the count (counter).
    */
    handleMultiply(event) {
      const factor = event.detail;
      this.counter *= factor;
    }

    @api
    maximizeCounter() {
      this.counter += 1000000;
    }
}
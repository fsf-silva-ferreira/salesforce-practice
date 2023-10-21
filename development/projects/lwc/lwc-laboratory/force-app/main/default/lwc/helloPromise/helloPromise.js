import { api, LightningElement } from 'lwc';

/** 
 * https://bobbyhadz.com/blog/javascript-cannot-set-property-of-undefined
 * https://stackoverflow.com/questions/65800264/how-to-fix-uncaught-in-promise-typeerror-cannot-set-property-of-undefined
*/
export default class HelloPromise extends LightningElement {

    @api
    helloPromise = 'Initial value';

    connectedCallback() {
        console.log('this.helloPromise before Promise: ' + this.helloPromise);
        this.setHelloPromise();
        console.log('this.helloPromise after Promise: ' + this.helloPromise);
    }

    setHelloPromise() {
        const myPromise = new Promise(function(myResolve) {
            setTimeout(function(){ myResolve("Hello Promise!"); }, 3000);
        });

        myPromise.then(value => {           
            this.helloPromise = value;
        });
    }
}
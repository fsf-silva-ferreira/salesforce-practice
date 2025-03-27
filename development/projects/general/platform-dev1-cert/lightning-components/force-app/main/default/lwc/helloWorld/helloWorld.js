/*
 * Documentation:
 * https://developer.salesforce.com/docs/platform/lwc/guide/reference-decorators.html
 * https://help.salesforce.com/s/articleView?id=release-notes.rn_lwc_track.htm&release=224&type=5
*/
import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

    //*Properties
    //The @track decorator is no longer required for LWC
    //This decorator is still neeed for object and array properties
    greeting = 'World';


    //*Methods
    changeHandler(event) {
        this.greeting = event.target.value;
    }
}
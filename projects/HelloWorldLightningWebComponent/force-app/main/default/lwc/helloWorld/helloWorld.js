/**
    * @description      : 
    * @author           : fodf
    * @group            : 
    * @created          : 07/12/2021 - 17:26:38
    * 
    * MODIFICATION LOG
    * - Version         : 1.0.0
    * - Date            : 07/12/2021
    * - Author          : fodf
    * - Modification    : New JS class.
**/
import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
  greeting = 'World';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
}
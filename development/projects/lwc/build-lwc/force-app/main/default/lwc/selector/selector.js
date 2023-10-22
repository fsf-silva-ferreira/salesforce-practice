import { LightningElement, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id';
import USER_NAME from '@salesforce/schema/User.Name';


const fields = [USER_NAME];
export default class Selector extends LightningElement {

    @wire(getRecord, { recordId: '$userId', fields })
    user;
    selectedProductId;
    userId = Id;

    handleProductSelected(evt) {
        this.selectedProductId = evt.detail;
    }
  
    get name() {
        return getFieldValue(this.user.data, USER_NAME);
    }
}
import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';


export default class CreateContactLDS extends LightningElement {

    contactName;
    contactPhone;
    contactEmail;
    
    contactNameChangeHandler(event) {
        this.contactName = event.target.value;
    }

    contactEmailChangeHandler(event) {
        this.contactEmail = event.target.value;        
    }

    contactPhoneChangeHandler(event) {
        this.contactPhone = event.target.value;
    }

    createContact() {
        const fields = 
        {
            'LastName':this.contactName, 
            'Phone':this.contactPhone, 
            'Email':this.contactEmail
        };
        
        const contactRecordInput = 
        {
            apiName:'Contact',
            fields
        };

        createRecord(contactRecordInput)
        .then(response => {
            console.log('Contact has been creates succesfully', response.id);
        })
        .catch(error => {
            console.log('Error in creating contact:', error.body);
        });
    }
}
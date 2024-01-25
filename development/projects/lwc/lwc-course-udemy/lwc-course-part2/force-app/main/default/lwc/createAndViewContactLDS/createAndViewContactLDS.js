import { LightningElement, wire } from 'lwc';
import { createRecord, getRecord } from 'lightning/uiRecordApi';


const fieldArray = 
[
    'Contact.LastName',
    'Contact.Phone',
    'Contact.Email'
]

export default class CreateAndViewContactLDS extends LightningElement {

    //Contact properties
    contactName;
    contactPhone;
    contactEmail;

    //New contact ID to retrieve data
    recordId;

    //Decorated property to store Contact data
    @wire(getRecord, {recordId:'$recordId', fields:fieldArray})
    contactRecord;

    //Event handlers
    handleContactNameChange(event) {
        this.contactName = event.target.value;
    }

    handleContactPhoneChange(event) {
        this.contactPhone = event.target.value;
    }

    handleContactEmailChange(event) {
        this.contactEmail = event.target.value;
    }

    createContact() {
        const fields = 
        {
            'LastName': this.contactName,
            'Phone': this.contactPhone,
            'Email': this.contactEmail
        };

        const contactRecordInput = 
        {
            apiName: 'Contact',
            fields
        }

        createRecord(contactRecordInput)
        .then(
            response => {
                this.recordId = response.id;
                console.log('Contact has been created: ' + this.recordId);
            }
        )
        .catch(
            error => {
                console.log('Error in creating contact: ' + error.body.message);
            }
        );
    }

    //Getters
    get newName() {
        if(this.contactRecord.data) {
            return this.contactRecord.data.fields.LastName.value;
        }

        return undefined;
    }

    get newPhone() {
        if(this.contactRecord.data) {
            return this.contactRecord.data.fields.Phone.value;
        }

        return undefined;
    }

    get newEmail() {
        if(this.contactRecord.data) {
            return this.contactRecord.data.fields.Email.value;
        }

        return undefined;
    }
}
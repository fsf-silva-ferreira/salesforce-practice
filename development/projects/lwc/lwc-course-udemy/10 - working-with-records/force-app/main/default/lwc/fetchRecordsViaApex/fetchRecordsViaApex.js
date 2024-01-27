import { LightningElement } from 'lwc';
import getAllContacts  from '@salesforce/apex/ContactManager.getContacts'


export default class FetchRecordsViaApex extends LightningElement {

    numberOfRecords;
    contacts;

    get responseReceived() {
        if(this.contacts) {
            return true;
        } 

        return false;
    }

    handleNumberOfContactsChange(event) {
        this.numberOfRecords = event.target.value;
    }

    getContacts() {
        console.log('number of records: ' + this.numberOfRecords);
        getAllContacts({numberOfRecords: this.numberOfRecords})
        .then(
            response => {
            console.log('Result: ' + response);
            this.contacts = response;
        })
        .catch(
            error => {
                console.log('Error in retrieving Contact records: ' + error.body.message);
            }    
        )
    }

    /*
    getContacts(){
        console.log('number of records: ' + this.numberOfRecords);
        getAllContacts({numberOfRecords:this.numberOfRecords}).then(response=>
        {this.contacts=response;
        }).catch(error=>{
             console.log('Error in retrieving contact records',error.body.message);
        });
    }*/
}
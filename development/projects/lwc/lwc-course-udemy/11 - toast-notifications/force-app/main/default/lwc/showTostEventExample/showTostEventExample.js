import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ShowTostEventExample extends LightningElement {

    handleSuccess(event) {
        const successToastEvent = new ShowToastEvent(
            {
                title: 'Success!!',
                message: 'This is a Success Message',
                variant: 'success'
            }
        );

        this.dispatchEvent(successToastEvent);
    }

    handleError(event) {
        const errorToastEvent = new ShowToastEvent(
            {
                title: 'Error!!',
                message: 'This is an Error Event',
                variant: 'error'
            }
        );

        this.dispatchEvent(errorToastEvent);
    }

    handleWarning(event) {
        const warningToastEvent = new ShowToastEvent(
            {
                title: 'Warning!!',
                message: 'This is an Warning Event',
                variant: 'warning'
            }
        );

        this.dispatchEvent(warningToastEvent);
    }

    handleInformation(event) {
        const infoToastEvent = ShowToastEvent(
            {
                title: 'Information!!',
                message: 'This is an Information Event',
                variant: 'info'
            }
        );

        this.dispatchEvent(infoToastEvent);
    }
}
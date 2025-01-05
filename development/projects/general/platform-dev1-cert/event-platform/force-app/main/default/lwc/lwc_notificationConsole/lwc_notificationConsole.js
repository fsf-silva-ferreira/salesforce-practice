import { subscribe, unsubscribe, onError } from "lightning/empApi";
import { LightningElement, track } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class Lwc_notificationConsole extends LightningElement {

    //* Arrays
    @track
    notifications = [];


    //*Getters
    get notificationCount() {
        return this.notifications.length;
    }


    //* Lifecycle hooks
    async connectedCallback() {
        this.handleEmpApiError();

        this.subscription = await subscribe(
            "/event/Notification__e",
            -1,
            (event) => this.handleNotificationEvent(event)
        );

        this.showSuccessToastMessage();
    }

    disconnectedCallback() {        
        unsubscribe(this.subscription);
    }


    //* Handlers
    handleClearClick() {
        this.notifications = [];
    }

    handleNotificationEvent(event) {
        console.log('Notification event to be handled: ' + JSON.stringify(event));

        const notification = getNotificationEvent(event);
        this.notifications.push(notification);

        console.log('Notification object: ' + JSON.stringify(notification));

        this.showInfoToastMessage();
    }    

    handleEmpApiError() {
        onError((error) => {
            this.showErrorToastMessage();

            console.log("EMP API error reported by server: ", JSON.stringify(error));
        });
    }


    //* Business logic
    getNotificationEvent(event) {
        console.log('Starting getNotificationEvent ...');
        const utcDate = new Date(event.data.payload.CreatedDate);

        const notification = {
            id:event.data.event.replayId,
            message:event.data.payload.Message__c,
            time: `${utcDate.getMinutes()}:${utcDate.getSeconds()}`
        };

        console.log('getNotificationEvent eneded');
        
        return notification;
    }

    showErrorToastMessage() {
        this.dispatchEvent(
            new ShowToastEvent({
                variant: "error",
                title: "EMP API Error",
                message: "Check your browser's developer console for more details."
            })
        );    
    }

    showSuccessToastMessage() {        
        this.dispatchEvent(
            new ShowToastEvent({
            variant: "success",
            title: "Ready to receive notifications"
            })
        );    
    }

    showInfoToastMessage() {        
        this.dispatchEvent(
            new ShowToastEvent({
                variant: "info",
                title: event.data.payload.Message__c
            })
        );       
    }
}
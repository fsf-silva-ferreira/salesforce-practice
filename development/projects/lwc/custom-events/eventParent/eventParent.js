/**
 * @description       : https://developer.salesforce.com/docs/platform/lwc/guide/events-create-dispatch.html
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 10-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
import { LightningElement } from 'lwc';

export default class EventParent extends LightningElement {

    page = 1;

    previousHandler() {
        if (this.page > 1) {
            this.page = this.page - 1;
        }
    }

    nextHandler() {
        this.page = this.page + 1;
    }
}
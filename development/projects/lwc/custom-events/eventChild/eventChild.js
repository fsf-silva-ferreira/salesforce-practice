/**
 * @description       : https://developer.salesforce.com/docs/platform/lwc/guide/events-create-dispatch.html
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 10-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
import { LightningElement } from 'lwc';

export default class EventChild extends LightningElement {

    previousHandler() {
        this.dispatchEvent(new CustomEvent("previous"));
    }
    
    nextHandler() {
        this.dispatchEvent(new CustomEvent("next"));
    }
}
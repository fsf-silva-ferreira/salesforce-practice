import { LightningElement, wire } from 'lwc';
import dataChannel from '@salesforce/messageChannel/DataChannel'; 
import { publish, subscribe, MessageContext } from 'lightning/messageService'; 

export default class MessageChannelSample extends LightningElement {

    @wire(MessageContext) messageContext; 
	
	// Method to publish a message 
	publishMessage() { 
		const message = { /* Your message payload */ }; 
	
		publish(this.messageContext, dataChannel, message); 
	} 
	
	// Method to subscribe to a message 
	connectedCallback() { 
		this.subscription = subscribe( 
			this.messageContext, DataChannel, (message) => this.handleMessage(message) 
		); 
	} 
		
	handleMessage(message) { 
		// Handle the received message 
	}
}
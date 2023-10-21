import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountService.getAccounts';

export default class SearchAccount extends LightningElement {

	@track accounts;
	@track error;

	handleKeyChange(event){
		const searchKey = event.target.value;
        
		getAccounts({ accountName: searchKey })
		.then(result => {
			this.accounts = result;
			this.error = undefined;
		})
		.catch(error => {
			this.error = error;
			this.accounts = undefined;
		})
	} 
}
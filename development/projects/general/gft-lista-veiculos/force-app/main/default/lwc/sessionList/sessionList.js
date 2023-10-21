/*
  Properties are always automatically reactive, which means that when the value of the property changes, 
  the component is automatically rerendered. 
  
  In this case we don't use the @track decorator, as we replace the value of the sessions array. 
  
  If we mutated the array, then we would use the @track decorator.
*/

/*
  Replace the import code on the first two lines with the following code.
  import { LightningElement } from 'lwc';

  This imports a wire adapter that is automatically generated from your Apex method. 
*/
import { LightningElement, wire } from 'lwc';
import getSessions from '@salesforce/apex/SessionController.getSessions';

//Remove import { getSessions } from 'data/sessionService';
//import { getSessions } from 'data/sessionService';

export default class SessionList extends LightningElement {
  sessions = [];
    
  /*
    The wire uses the getSessions adapter that maps to our Apex endpoint. 
    
    The wire is called with a searchKey parameter that is mapped to the searchKey property. 
    
    Notice that the parameter value is passed as a string with a $ prefix. 
    
    This means that this parameter is reactive: The wire is called each time searchKey changes.
  */
  searchKey = '';
  @wire(getSessions, { searchKey: '$searchKey' })
  wiredSessions({ error, data }) {
    if (data) {
      this.sessions = data;
    } else if (error) {
      this.sessions = [];
      throw new Error('Failed to retrieve sessions');
    }
  }
  
  /*
    The filtering is no longer performed on the client side. 
    
    searchKey is now passed to the wire so that the Apex returns the filtered session list. 
    
    You are debouncing the searchKey property update by applying a 300-millisecond delay to the update. 
    
    This is to avoid a very large number of Apex method calls.
  */
  handleSearchKeyInput(event) {
    clearTimeout(this.delayTimeout);
    const searchKey = event.target.value;
    // eslint-disable-next-line @lwc/lwc/no-async-operation
    this.delayTimeout = setTimeout(() => {
        this.searchKey = searchKey;
    }, 300);
  }

  /*
    You now use the session record Id instead of the session list index to navigate to a session detail page.
  */
  handleSessionClick(event) {
    const { sessionId } = event.currentTarget.dataset;
    const navigateEvent = new CustomEvent('navigate', {
      detail: {
        state: 'details',
        sessionId: sessionId
      }
    });
    this.dispatchEvent(navigateEvent);
  }
}
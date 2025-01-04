({
    
  /*
   * The onInit function subscribes to the platform event channel by calling the helper subscribe() 
   * function. 
   * 
   * Next, the function displays a toast message indicating that the app is ready to receive 
   * notifications.
   */ 
  // Called when the component is initialized.
  // Subscribes to the channel and displays a toast message.
  // Specifies an error handler function for empApi
  onInit: function (component, event, helper) {
    component.set('v.subscription', null);
    component.set('v.notifications', []);
    // Get empApi component.
    const empApi = component.find('empApi');
    // Define an error handler function that prints the error to the console.
    const errorHandler = function (message) {
      console.error('Received error ', JSON.stringify(message));
    };
    // Register empApi error listener and pass in the error handler function.
    empApi.onError($A.getCallback(errorHandler));
    helper.subscribe(component, event, helper);
    helper.displayToast(component, 'success', 'Ready to receive notifications.');
  },
    
  /*
   * Clears the notification history.
   */
  onClear: function (component, event, helper) {
    component.set('v.notifications', []);
  },
  
  /*
   * The onToggleMute() function stops the subscription when the app is muted and doesn't display any 
   * toasts. 
   * 
   * When the app is unmuted, subscription resumes and new messages display in the console and in 
   * toasts.
   */
  // Mute toast messages and unsubscribe/resubscribe to channel.
  onToggleMute: function (component, event, helper) {
    const isMuted = !(component.get('v.isMuted'));
    component.set('v.isMuted', isMuted);
    if (isMuted) {
      helper.unsubscribe(component, event, helper);
    } else {
      helper.subscribe(component, event, helper);
    }
    helper.displayToast(component, 'success', 'Notifications ' +
      ((isMuted) ? 'muted' : 'unmuted') + '.');
  }
})
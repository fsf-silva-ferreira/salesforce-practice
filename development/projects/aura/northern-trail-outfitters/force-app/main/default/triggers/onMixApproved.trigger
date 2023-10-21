trigger onMixApproved on Mix_Approved__e (after insert) {

    // This commented out trigger shows how to listen to a Platform Event programatically.
    // You can also listen to a Platform Event declaratively using a Process Builder process.
    // See the "Mix Approved" Process for an example.

    /*
    List<Merchandising_Mix__c> mixes = new List<Merchandising_Mix__c>();
    
    for (Mix_Approved__e event : Trigger.New) {
		Merchandising_Mix__c mix = new Merchandising_Mix__c();
		mix.Id = event.Mix_Id__c;
        mix.Status__c = 'Approved by Manufacturing';
        mix.Confirmation_Number__c = event.Confirmation_Number__c;
        mixes.add(mix);
    }

	update mixes;
    */
    
}
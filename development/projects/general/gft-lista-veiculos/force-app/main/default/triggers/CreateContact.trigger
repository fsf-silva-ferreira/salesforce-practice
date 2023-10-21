trigger CreateContact on Candidate__c (before insert) {
    /* Invoke the createContact method with a list of Candidates as the argument
    to create a corresponding Contact from each new Candidate Record */
    CreateContactFromCan.CreateContact(Trigger.new);
}
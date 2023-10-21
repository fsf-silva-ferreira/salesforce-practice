// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Account {
    global Id Id;
    global Boolean IsDeleted;
    global Account MasterRecord;
    global Id MasterRecordId;
    global String Name;
    global String Type;
    global RecordType RecordType;
    global Id RecordTypeId;
    global Account Parent;
    global Id ParentId;
    global String BillingStreet;
    global String BillingCity;
    global String BillingState;
    global String BillingPostalCode;
    global String BillingCountry;
    global Double BillingLatitude;
    global Double BillingLongitude;
    global String BillingGeocodeAccuracy;
    global Address BillingAddress;
    global String ShippingStreet;
    global String ShippingCity;
    global String ShippingState;
    global String ShippingPostalCode;
    global String ShippingCountry;
    global Double ShippingLatitude;
    global Double ShippingLongitude;
    global String ShippingGeocodeAccuracy;
    global Address ShippingAddress;
    global String Phone;
    global String Fax;
    global String AccountNumber;
    global String Website;
    global String PhotoUrl;
    global String Sic;
    global String Industry;
    global Decimal AnnualRevenue;
    global Integer NumberOfEmployees;
    global String Ownership;
    global String TickerSymbol;
    global String Description;
    /* This indicates the likelihood of a sale being made to this account in the next six months. Cold indicates not likely. Warm indicates quite likely. Hot indicates very likely.
    */
    global String Rating;
    global String Site;
    global User Owner;
    global Id OwnerId;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime SystemModstamp;
    global Date LastActivityDate;
    global Datetime LastViewedDate;
    global Datetime LastReferencedDate;
    global String Jigsaw;
    global String JigsawCompanyId;
    global String CleanStatus;
    global String AccountSource;
    global String DunsNumber;
    global String Tradestyle;
    global String NaicsCode;
    global String NaicsDesc;
    global String YearStarted;
    global String SicDesc;
    global DandBCompany DandbCompany;
    global Id DandbCompanyId;
    global String CustomerPriority__c;
    global String SLA__c;
    global String Active__c;
    global Double NumberofLocations__c;
    global String UpsellOpportunity__c;
    global String SLASerialNumber__c;
    global Date SLAExpirationDate__c;
    global String Data_Quality_Description__c;
    global Double Data_Quality_Score__c;
    /* Does this customer have a current support plan? Check this box when selling a support plan to that customer.
    */
    global Boolean Has_Support_Plan__c;
    /* When should the current support plan be renewed?
    */
    global Date Support_Plan_Expiration_Date__c;
    /* In which region is the customer based?
    */
    global String Region__c;
    /* In which zone is this customer based? Depends on region.
    */
    global String Zone__c;
    global Decimal Opportunity_Sum__c;
    global Decimal Potential_Value__c;
    global Boolean Match_Billing_Address__c;
    global Double Number_of_Contacts__c;
    global String category__c;
    global List<Account> ChildAccounts;
    global List<AccountCleanInfo> AccountCleanInfos;
    global List<AccountContactRole> AccountContactRoles;
    global List<AccountFeed> Feeds;
    global List<AccountHistory> Histories;
    global List<AccountPartner> AccountPartnersFrom;
    global List<AccountPartner> AccountPartnersTo;
    global List<AccountShare> Shares;
    global List<ActivityHistory> ActivityHistories;
    global List<Asset> Assets;
    global List<Asset> ProvidedAssets;
    global List<Asset> ServicedAssets;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<Attachment> Attachments;
    global List<Case> Cases;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<CombinedAttachment> CombinedAttachments;
    global List<Contact> Contacts;
    global List<ContactPointEmail> ContactPointEmails;
    global List<ContactPointPhone> ContactPointPhones;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global List<Contract> Contracts;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global List<Energy_Audit__c> Energy_Audits__r;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<Event> Events;
    global List<LiveChatTranscript> LiveChatTranscripts;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global List<Opportunity> Opportunities;
    global List<OpportunityPartner> OpportunityPartnersTo;
    global List<Order> Orders;
    global List<Partner> PartnersFrom;
    global List<Partner> PartnersTo;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordAction> RecordActions;
    global List<RecordActionHistory> RecordActionHistories;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<User> Users;
    global List<AccountChangeEvent> Parent;
    global List<AccountContactRoleChangeEvent> Account;
    global List<AgentWork> WorkItem;
    global List<AssetChangeEvent> Account;
    global List<AssetChangeEvent> AssetProvidedBy;
    global List<AssetChangeEvent> AssetServicedBy;
    global List<CampaignMember> LeadOrContact;
    global List<CaseChangeEvent> Account;
    global List<ContentDistribution> RelatedRecord;
    global List<ContentVersion> FirstPublishLocation;
    global List<ContractChangeEvent> Account;
    global List<EventChangeEvent> What;
    global List<EventRelationChangeEvent> Relation;
    global List<FeedComment> Parent;
    global List<FlowRecordRelation> RelatedRecord;
    global List<Lead> ConvertedAccount;
    global List<LiveChatTranscriptChangeEvent> Account;
    global List<OutgoingEmail> RelatedTo;
    global List<PendingServiceRouting> WorkItem;
    global List<Task> Account;
    global List<TaskChangeEvent> What;
    global List<UserChangeEvent> Account;
    global List<UserRole> PortalAccount;

    global Account () 
    {
    }
}
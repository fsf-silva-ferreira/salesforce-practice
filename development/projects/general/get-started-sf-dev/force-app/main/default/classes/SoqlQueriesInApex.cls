/**
 * @description       : Creating a SOQL query in a method; Manipulating data returned by a SOQL query.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Source: 
 * https://trailhead.salesforce.com/content/learn/modules/soql-for-admins/use-bind-variables-and-aggregate-functions?trail_id=build-apex-coding-skills
**/
public with sharing class SoqlQueriesInApex {

    public static List<Contact> getListOfContacts() {
        List<Contact> listOfContacts = [SELECT FirstName, LastName FROM Contact];

        for(Contact contactItem : listOfContacts) {
            String fullName = 'First name: ' + contactItem.FirstName + ', Last name: ' + contactItem.LastName;
            system.debug(fullName);
        }

        return listOfContacts;
    }

    public static void fixContactName() {
        List<Contact> contactsToFix = [SELECT Name, FirstName, LastName FROM Contact WHERE FirstName = null];

        for(Contact contactToFix : contactsToFix) {
            if(contactToFix.LastName.contains(' ')) {
                String[] contactLastNameSplit = contactToFix.LastName.split(' ');

                contactToFix.FirstName = contactLastNameSplit[0];
                contactToFix.LastName = contactLastNameSplit[1];
            }

            system.debug('First name: ' + contactToFix.FirstName + ', Last name: ' + contactToFix.LastName);
        }

        update contactsToFix;
    }

    public static List<Contact> runChildToParentQuery() {
        List<Contact> contactsWithAccount = [SELECT Name, Account.Name FROM Contact WHERE AccountId != NULL];

        for(Contact contactWithAccount : contactsWithAccount) {
            System.debug('Contact name: ' + contactWithAccount.Name + ', Parent Account name: ' + contactWithAccount.Account.Name);    
        }

        return contactsWithAccount;
    }

    public static List<Account> runParentToChildQuery() {
        List<Account> accountsWithContacts = new List<Account>();
        List<Account> parentAccounts = [SELECT Name, (SELECT Name FROM Contacts) FROM Account];

        for(Account parentAccount : parentAccounts) {
            if(parentAccount.Contacts.size() > 0) {
                System.debug('Account Name: ' + parentAccount.Name); 
                System.debug('Contacts:');
                for(Contact childContact : parentAccount.Contacts) {
                    System.debug('  -> Contact Name: ' + childContact.Name);
                } 

                accountsWithcontacts.add(parentAccount);
            }             
        }

        return accountsWithContacts;
    }

    public static Map<Account,List<Contact>>filterWithSubquery() {
        List<Account> accountsWithOnlyForbesContact = new List<Account>();
        Map<Account,List<Contact>> forbesContactsByAccount = new Map<Account,List<Contact>>();
        List<Account> parentAccountsWithForbesContact = [
            SELECT 
                Name, (SELECT Name FROM Contacts)
            FROM 
                Account
            WHERE 
                Id IN (SELECT AccountId FROM Contact WHERE LastName = 'Forbes')
        ];

        for(Account accountWithForbesContact : parentAccountsWithForbesContact) {
            Account accountWithOnlyForbesContact = new Account();
            accountWithOnlyForbesContact.Id = accountWithForbesContact.Id;
            accountWithOnlyForbesContact.Name = accountWithForbesContact.Name;

            List<Contact> forbesContacts = new List<Contact>();
            for(Contact childContact : accountWithForbesContact.Contacts) {
                if(childContact.Name.contains('Forbes')) {
                    forbesContacts.add(childContact);
                }                
            }

            forbesContactsByAccount.put(accountWithOnlyForbesContact, forbesContacts);
        }

        System.debug('Filtering done: ' + forbesContactsByAccount);

        return forbesContactsByAccount;
    }

    public static List<Property__c> runChildToParentQueryCustom() {
        List<Property__c> listOfProperties = [
            SELECT 
                Address__c
                ,Picture__c
                ,Broker__r.Name 
            FROM 
                Property__c
        ]; 

        System.debug('List of properties - ' + listOfProperties.size() + ' records:');
        for(Property__c property : listOfProperties) {
            System.debug(property);
        }

        return listOfProperties;
    }

    public static List<Broker__c> runParentToChildQueryCustom() {
        List<Broker__c> listOfBrokers = [
            SELECT 
                Name
                ,(SELECT Address__c, Price__c FROM Properties__r) 
            FROM 
                Broker__c
        ];

        System.debug('List of brokers - ' + listOfBrokers.size() + ' records:');
        for(Broker__c broker : listOfBrokers) {        
            List<Property__c> brokerProperties = broker.Properties__r;

            System.debug('Number of properties with the broker ' + broker.Name + ': ' + brokerProperties.size());
            for(Property__c brokerProperty : brokerProperties) {
                System.debug(' -> Address: ' + brokerProperty.Address__c + ' | Price: ' + brokerProperty.Price__c);
            }
        }

        return listOfBrokers;
    }

    public static List<Property__c> runQueryWithBindVariableHomeValue() {
        Integer maxHomeValue = 200000;
        List<Property__c> property = [SELECT Name, Price__c FROM Property__c WHERE Price__c < :maxHomeValue];

        System.debug(property);

        return property;
    }

    //Reference:
    //https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_SOQL_agg_fns.htm 
    public static Integer runQueryWithAggregateCount() {
        List<AggregateResult> aggretateResults = [SELECT COUNT(Name) brokersCount FROM Broker__c];
        Object brokersCount = aggretateResults[0].get('brokersCount');
        Integer numberOfBrokers = (Integer) brokersCount;

        System.debug('Integer value extracted from COUNT aggregate function: ' + numberOfBrokers);

        return numberOfBrokers;
    }

    public static Decimal runQueryWithAggregateMin() {
        List<AggregateResult> aggretateResults = [SELECT MIN(Days_On_Market__c) minDaysOnMarket FROM Property__c];
        Object brokersCount = aggretateResults[0].get('minDaysOnMarket');
        Decimal minDaysOnMarket = (Decimal) brokersCount;

        System.debug('Integer value extracted from MIN aggregate function: ' + minDaysOnMarket);

        return minDaysOnMarket;
    }

    public static Integer runQueryWithAggregateCountDistinct() {
        List<AggregateResult> aggretateResults = [SELECT COUNT_DISTINCT(City__c) cityCount FROM Property__c];
        Object cityCount = aggretateResults[0].get('cityCount');
        Integer numberOfCities = (Integer) cityCount;

        System.debug('Integer value extracted from COUNT_DISTINCT aggregate function: ' + numberOfCities);

        return numberOfCities;
    }

    public static List<String> getPropertiesCities() {
        List<String> propertiesCities = new List<String>();
        List<Property__c> properties = [SELECT City__c FROM Property__c];

        for(Property__c property : properties) {
            if(!propertiesCities.contains(property.City__c)) {
                propertiesCities.add(property.City__c);

                System.debug('City added to the list: ' + property.City__c);
            }
        }

        return propertiesCities;
    }

    public static List<String> getBrokersWhoSoldProperties() {
        List<AggregateResult> aggretateResults = [
            SELECT 
                MAX(Status__c) theMostAdvancedStatus
                ,Broker__r.Name brokerName
            FROM 
                Property__c
            GROUP BY 
                Broker__r.Name
            HAVING 
                MAX(Status__c) = 'Closed'
        ];    

        List<String> brokersWhoSoldProperties = new List<String>();
        for(AggregateResult aggregateResult : aggretateResults) {
            Object brokerName = aggregateResult.get('brokerName');
            brokersWhoSoldProperties.add((String) brokerName); 
        }

        System.debug('Brokers who sold properties: ' + brokersWhoSoldProperties);

        return brokersWhoSoldProperties;
    }
}
PushTopic pushTopic = new PushTopic();
pushTopic.Name = 'MixStatusChange';
pushTopic.Query = 'SELECT Id, Status__c FROM Merchandising_Mix__c';
pushTopic.ApiVersion = 44.0;
pushTopic.NotifyForOperationUpdate = true;
pushTopic.NotifyForFields = 'Referenced';
insert pushTopic;
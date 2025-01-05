/**
 * @description       : Handling bear alert tpopic assignments.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * 
 * References:
 * https://developer.salesforce.com/docs/atlas.en-us.platform_events.meta/platform_events/platform_events_publish_api.htm
 * https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status/202
 * https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_topicassignment.htm
 * 
**/
public with sharing class BearAlertTopicAssignmentHandler {
    
    //* Bear alert publishing process
    public static void handleTopicAssignments(List<TopicAssignment> topicAssignments) {
        Map<Id,FeedItem> feedItems = getFeedItems(topicAssignments);
        List<String> messages = createBearAlertMessages(feedItems);
        List<Database.SaveResult> publishingResults = publishNotificationMessages(messages);
        inspectPublishingResults(publishingResults);       
    }


    //* Process steps definitions
    private static Map<Id,FeedItem> getFeedItems(List<TopicAssignment> topicAssignments) {
        // Get FeedItem posts only
        Set<Id> feedIds = new Set<Id>();
        for (TopicAssignment ta : topicAssignments){
            if (ta.EntityId.getSObjectType().getDescribe().getName().equals('FeedItem')) {
                feedIds.add(ta.EntityId);
            }
        }

        Map<Id,FeedItem> feedItems = new Map<Id,FeedItem>([SELECT Body FROM FeedItem WHERE Id IN :feedIds]);

        return feedItems;
    }

    private static List<String> createBearAlertMessages(Map<Id,FeedItem> feedItems) {
        List<String> messages = new List<String>();
        for (TopicAssignment ta : [SELECT Id, EntityId, Topic.Name FROM TopicAssignment WHERE Id IN :Trigger.new AND Topic.Name = 'BearAlert']) {
            messages.add(feedItems.get(ta.EntityId).body.stripHtmlTags().abbreviate(255));
        }

        return messages;
    }

    private static List<Database.SaveResult> publishNotificationMessages(List<String> messages) {
        List<Notification__e> notifications = new List<Notification__e>();
        for (String message: messages) {
            notifications.add(new Notification__e(Message__c = message));
        }

        List<Database.SaveResult> results = EventBus.publish(notifications);

        return results;
    }

    private static void inspectPublishingResults(List<Database.SaveResult> publishingResults) {
        for (Database.SaveResult result : publishingResults) {
            if (!result.isSuccess()) {
                for (Database.Error error : result.getErrors()) {
                    System.debug('Error returned: ' + error.getStatusCode() +' - '+ error.getMessage());
                }
            } else {
                System.debug('Notification messages published successfully.');
            }
        }
    }
}
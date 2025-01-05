/**
 * @description       : Listening inserts of new topicAssignment records.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-03-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger BearAlertTopicAssignmentTrigger on TopicAssignment (after insert) {

    BearAlertTopicAssignmentHandler.handleTopicAssignments(Trigger.new);
}
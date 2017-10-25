// Need to have created the Thesaurus__c custom object

// Class
public with sharing class EndTheRecursiveTrigger {

    public static boolean endTheTriggerCallStack = false;
    
}

// Trigger
trigger BuildReciprocalRelationship on Thesaurus__c (after insert) {
    List<Thesaurus__c> relationships = new List<Thesaurus__c> ();
    if ( EndTheRecursiveTrigger.endTheTriggerCallStack == false ) {
        for (Thesaurus__c r : Trigger.new) {
            Thesaurus__c reverseRelationship = new Thesaurus__c();
            reverseRelationship.Search_Term__c = r.Related_Word__c;
            reverseRelationship.Related_Word__c = r.Search_Term__c;
            reverseRelationship.Relationship_Type__c = r.Relationship_Type__c;
            relationships.add(reverseRelationship);
        }
        EndTheRecursiveTrigger.endTheTriggerCallStack = true;
        insert relationships;
        EndTheRecursiveTrigger.endTheTriggerCallStack = false;
    }
}

// Example Execute Anon code to test
List<Thesaurus__c> words = new List<Thesaurus__c>();
for (Integer i = 1; i <= 300; i++) {
    Thesaurus__c word = new Thesaurus__c(Search_Term__c='Term ' + i,
                                         Related_Word__c='Opposite ' + i,
                                         Relationship_Type__c='Antonym');
    words.add(word);
}
insert words;

// Execute Anon code to remove records
delete [SELECT Id FROM Thesaurus__c];
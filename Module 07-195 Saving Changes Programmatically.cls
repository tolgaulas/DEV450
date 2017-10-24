// SELECT Id, LastName, LeadSource FROM Contact WHERE LeadSource ='Trade Show'

List<Contact> oldLeadSourceContacts = 
    [SELECT LeadSource FROM Contact WHERE LeadSource ='Trade Show'];

Set<Id> oldLeadSourceContactsIds = new Set<Id>(); 
for (Contact c : oldLeadSourceContacts) {
    c.LeadSource = 'Other';
    oldLeadSourceContactsIds.add(c.Id);
}

update oldLeadSourceContacts;

List<Contact> updatedLeadSourceContacts = 
    [SELECT LeadSource FROM Contact WHERE Id IN :oldLeadSourceContactsIds];
for (Contact c : updatedLeadSourceContacts) {
    if (c.LeadSource <> 'Other')
        System.debug('Update failed');
}


// Upserting using an external ID. First add a record (using dummy Sample object)
Sample__c sample = new Sample__c();
sample.Name = 'My Sample';
sample.Description__c = 'My Sample description';
sample.External_Identifier__c = 'SAMP1';
upsert sample;

// Then modify it
Sample__c samp = new Sample__c();
samp.Description__c = 'Modified description';
samp.External_Identifier__c = 'SAMP1';

// either
upsert samp External_Identifier__c;

// or
Schema.SObjectField extID = Sample__c.Fields.External_Identifier__c;
database.upsert(samp, extId);
//database.upsert(samp, extId, true); // Optionally can add the AllOrNone boolean on the end

// Selecting from the recycle bin - delete previously added sample__c record
// Need to use ALL ROWS to see stuff in recycle bin BUT Query will not parse when run from query editor
SELECT Id, Name, IsDeleted FROM Sample__c WHERE IsDeleted = true ALL ROWS

// Only works from code
List<Sample__c> samps = [SELECT Id FROM Sample__c WHERE IsDeleted = true ALL ROWS];
system.debug(samps);
undelete samps;


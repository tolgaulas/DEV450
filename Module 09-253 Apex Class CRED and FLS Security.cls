// Check Object CRUD
System.debug('Create in Object CRED? ' + Schema.sObjectType.Course__c.isCreateable());
System.debug('Read in Object CRUD? ' + Schema.sObjectType.Course__c.isAccessible());
System.debug('Update in Object CRUD? ' + Schema.sObjectType.Course__c.isUpdateable());
System.debug('Delete in Object CRUD? ' + Schema.sObjectType.Course__c.isDeletable());

// Check Field Level Security 
System.debug('Read in FLS? ' + Schema.sObjectType.Course__c.fields.Status__c.isAccessible());
System.debug('Edit in FLS? ' + Schema.sObjectType.Course__c.fields.Status__c.isUpdateable());

// Simple use case
String soqlString;
if (Schema.sObjectType.Course__c.fields.Status__c.isAccessible()) {
     soqlString = 'SELECT id, status__c FROM Course__c';
} else {
     soqlString = 'SELECT id FROM Course__c';
}
System.debug(soqlString);
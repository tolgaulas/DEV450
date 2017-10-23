// Set Database, Apex Code and Profiling log levels to Finest and System to Fine

Contact contactToAdd = new Contact();
contactToAdd.firstName = 'June';
contactToAdd.lastName = 'Morgan';
insert contactToAdd;
System.debug('contactToAdd recordID is: ' + contactToAdd.id);
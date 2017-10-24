// Standalone DML
Contact withName = 
    new Contact(LastName = 'Soto');
Contact noName = new Contact();
List<Contact> contacts = new List<Contact>();
contacts.add(withName);
contacts.add(noName);
insert contacts; 

// Database.method with allOrNone set to false
Contact withName = 
    new Contact(LastName = 'Soto');
Contact noName = new Contact();
List<Contact> contacts = new List<Contact>();
contacts.add(withName);
contacts.add(noName);
Database.insert(contacts, false);

// SELECT LastName FROM Contact WHERE LastName='Soto'
Contact withName = new Contact(LastName = 'Santoyo');
Contact noName = new Contact();
List<Contact> contacts = new List<Contact>();
contacts.add(withName);
contacts.add(noName);
insert contacts;  // Inserted contacts need a last name

// SELECT LastName FROM Contact WHERE LastName='Santoyo'

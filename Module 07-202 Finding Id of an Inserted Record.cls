Contact withName = 
    new Contact(LastName = 'Okoye');
List<Contact> contacts = new List<Contact>();
contacts.add(withName);
insert contacts; 

// After a successful insert, the variable that holds the instance of
// the inserted sObject is updated with the Id
System.debug(withName.Id);

public class ContactManager {
    
    public static ID addContact(String lastNameToInsert, String firstNameToInsert) {
        Contact contactToAdd = new Contact(FirstName=firstNameToInsert,
                                           LastName=lastNameToInsert);
        insert(contactToAdd);
        System.debug('contactToAdd recordID is: ' + contactToAdd.Id);
        return contactToAdd.Id;
    }
}

// Execute Anonymous
ID contactID = ContactManager.addContact('Rehman','Areil');
System.debug('Called from Execute Anonymous: ID is: ' + contactID);

// OR - without making the method Static

public class ContactManager {

	public ContactManager () {
		System.debug('Hello from the Constructor');
	}

    public ID addContact(String lastNameToInsert, String firstNameToInsert) {
        Contact contactToAdd = new Contact(FirstName=firstNameToInsert,
                                           LastName=lastNameToInsert);
        insert(contactToAdd);
        System.debug('contactToAdd recordID is: ' + contactToAdd.Id);
        return contactToAdd.Id;
    }
}

// Execute Anonymous
ContactManager conMan = new ContactManager();
ID contactID = conMan.addContact('Rehman','Areil');
System.debug('Called from Execute Anonymous: ID is: ' + contactID);
public class ContactsDML {
    public static void standaloneDML(){
        //----------------------------------------------------------
        // TASK 1: Use standalone DML command to insert new Contacts.
        //----------------------------------------------------------
        
        // TODO #1: Declare a variable whose type is Contact named name1
        //          and initialize it to a newly constructed Contact sObject 
        //          assigning the field LastName the value 'Minkowitz'.
        Contact name1 = new Contact(LastName = 'Minkowitz');
        
        // TODO #2: Declare a variable whose type is Contact named name2
        //          and initialize it to a newly constructed Contact sObject 
        //          assigning the field LastName the value 'Singh'.
        Contact name2 = new Contact(LastName='Singh');
        
        // TODO #3: Declare a variable whose type is a List of Contact sObjects   
        //          named contacts and initialize it to a newly constructed List.
        List<Contact> contacts = new List<Contact>();
        
        // TODO #4: Add name1 to the list contacts.
        contacts.add(name1);
        
        // TODO #5: Add name2 to the list contacts.
        contacts.add(name2);
        
        // TODO #6: Use the standalone insert command to insert contacts into the database. 
        insert contacts;
        
        // When you successfully insert an sObject instance, the ID of the 
        // inserted instance is returned to it.
        // TODO #7: Write a statement to output the ID of name1 into the debug log.
        System.debug('The Id of name1: ' + name1.Id);
        
        // TODO #8: Write a statement to output the ID of name2 into the debug log.
        System.debug('The Id of name2: ' + name2.Id);
    }
    
    public static void databaseMethodDML(){
        //-------------------------------------------------------------
        // TASK 2: Use a Database class method to insert Contacts.
        //-------------------------------------------------------------
        
        // TODO #1: Declare a variable whose type is Contact named name1.
        //          It should not set any fields.
        Contact name1 = new Contact();
        
        // TODO #2: Declare a variable whose type is Contact named name2
        //          and initialize it to a newly constructed Contact sObject 
        //          assigning the field LastName the value 'Picasso'.
        Contact name2 = new Contact(LastName = 'Picasso');
        
        // TODO #3: Declare a variable whose type is a List of Contact sObjects   
        //          named contacts and initialize it to a newly constructed List.
        List<Contact> contacts = new List<Contact>();
        
        // TODO #4: Add name1 and name2 to the list contacts.
        contacts.add(name1);
        contacts.add(name2);
        
        // TODO #5: Use the Database.insert command to replicate the
        //          behavior you would expect by issuing the command:
        //          insert contacts;
        //          Because name1 has not been assigned a string value, 
        //          you should expect a DMLexception.
        Database.insert(contacts);
    }
	
    public static void databaseMethodDMLAllOrNone(){
        //-----------------------------------------------------------------------------
        // TASK 3: Use a Database class method to insert Contacts with a partial commit
        //-----------------------------------------------------------------------------
        
        // TODO #1: Declare a variable whose type is Contact named name1.
        //          It should not set any fields.
        Contact name1 = new Contact();
        
        // TODO #2: Declare a variable whose type is Contact named name2
        //          and initialize it to a newly constructed Contact sObject 
        //          assigning the field LastName the value 'Picasso'.
        Contact name2 = new Contact(LastName = 'Picasso');
        
        // TODO #3: Declare a variable whose type is a List of Contact sObjects   
        //          named contacts and initialize it to a newly constructed List.
        List<Contact> contacts = new List<Contact>();
        
        // TODO #4: Add name1 and name2 to the list contacts.
        contacts.add(name1);
        contacts.add(name2);
        
        // TODO #5: Use the Database.insert command to insert the Contacts
        //          in contacts, with a partial commit.
        Database.insert(contacts, false);
        
        // TODO #6: Print the id of name2 to the debug log.
        System.debug('The Id of name2: ' + name2.id);
    }
}

// Units tests for the above class/methods

@isTest
private class ContactsDML_Test {
    //This method verifies that the standaloneDML method inserts two contacts into the database.
    private static testMethod void standaloneDMLTest(){
        // TODO #1: Review the code below to see how we are using  
        //          the assertEquals method of the System class to  
        //          ensure that there are no Contacts in the db.
        System.assertEquals(0, [SELECT LastName FROM Contact].size());
        
        // Call the standaloneDML method of the ContactsDML class.
        ContactsDML.standaloneDML();
        
        List<Contact> contactsPostInsert = [SELECT LastName FROM Contact];
        // TODO #2: Review the code below to see how we are using  
        //          the assertEquals method of the System class to  
        //          ensure that there are two Contacts in the db.
        System.assertEquals(2, contactsPostInsert.size());
        
        // TODO #3: Review the code below to see how we are using 
        //          the assert method of the System class to ensure that the 
        //          Contacts in the db contain the LastNames - 'Minkowitz' and 'Singh'
        Set<String> lastNameSet = new Set<String>();
        for(Contact contact : contactsPostInsert){
            lastNameSet.add(contact.LastName);
        }
        System.assert(lastNameSet.contains('Minkowitz'));
        System.assert(lastNameSet.contains('Singh'));
    }

    //This method verifies that the databaseMethodDML method fails to insert two 
    //contacts into the database, because one contact does not include the LastName 
    //field and the DML method is using the default allOrNone value of true.  
    private static testMethod void databaseMethodDMLTest(){
        // TODO #4: Review the code below to see how we are using
        //          the assert method of the System class to verify that the error message 
        //          returned by the getMessage method of the DMLException class contains the string 
        //          'Required fields are missing: [LastName]: [LastName]'.      
        try{
            ContactsDML.databaseMethodDML();
        } catch(DMLException e){
            System.assert(e.getMessage().contains('Required fields are missing: [LastName]: [LastName]'));
        } 
    }

    //This method verifies that the databaseMethodDMLAllOrNone method inserts one
    //contact into the database, because one contact does not include the LastName 
    //field and the DML method is using the value of false for the parameter allOrNone.      
    private static testMethod void databaseMethodDMLAllOrNoneTest(){
        // TODO #5: Review the code below to see how we are using  
        //          the assertEquals method of the System class to 
        //          ensure that there are no Contacts in the db.
        System.assertEquals(0, [SELECT LastName FROM Contact].size());
        
        ContactsDML.databaseMethodDMLAllOrNone();
        
        // TODO #6: Review the code below to see how we are using  
        //          the assertEquals method of the System class to 
        //          ensure that there is only one Contact in the db.
        List<Contact> contactsPostInsert = [SELECT LastName FROM Contact];
        System.assertEquals(1, contactsPostInsert.size());
        
        // TODO #7  Review the code below to see how we are using  
        //          the assertEquals method of the System class to ensure  
        //          that the LastName of the Contact in the db contains 'Picasso'
        System.assertEquals('Picasso', contactsPostInsert[0].LastName);
    }
}

// Execute anonymous variant
ContactsDML.standaloneDML();                // Expect contacts name1 and name2 to be added
ContactsDML.databaseMethodDML();            // Expect DML Exception
ContactsDML.databaseMethodDMLAllOrNone();   // Expect contact name2 to be added (name1 fails)
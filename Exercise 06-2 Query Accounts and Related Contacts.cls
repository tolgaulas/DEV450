//--------------------------------------------------------------------------------------------
//TASK 1: Write and test a query that selects all Accounts and their related Contacts.
//        The query should select the Name field from Account as well as the LastName 
//        field of the related Contact record.
//--------------------------------------------------------------------------------------------
//SELECT Name, (SELECT LastName FROM Contacts) FROM Account

List<Account> accounts = [SELECT Name, (SELECT LastName FROM contacts) FROM account];
for ( Account account : accounts ) {
    for ( Contact contact : account.Contacts ) {
        System.debug('Account ' + account.Name + ', Contact ' + contact.LastName);
    }
}
	
//--------------------------------------------------------------------------------------------
//TASK 2: Write and test a query that selects only Certifications that have related Courses.
//        The query should select the Name fields from Certification__c and Course__c.
//--------------------------------------------------------------------------------------------
//SELECT Name, (SELECT Name FROM Courses__r) FROM Certification__c 
//   WHERE Id IN (SELECT Certification__c from Course__c)

List<Certification__c> certifications = [SELECT Name, (SELECT Name FROM Courses__r) FROM Certification__c 
											WHERE Id IN (SELECT Certification__c from Course__c)];
for ( Certification__c certification : certifications ) {
	for ( Course__c course : certification.Courses__r) {
		System.debug('Certification ' + certification.Name + ', Course ' + course.Name);
	}
}
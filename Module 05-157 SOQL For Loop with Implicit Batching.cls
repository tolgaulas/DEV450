// Insert some Accounts
List<Account> accs = new List<Account>();
for (Integer i=0; i<500; ++i) {
    accs.add(new Account(Name = 'Acc' + i));
}
insert accs;

// Select the inserted accounts in a "normal" For Loop
Integer count = 0;
for (Account acc : [SELECT Name FROM Account WHERE Name LIKE 'Acc%']) {
	count++;
    //System.debug(acc.Name);
}
System.debug('Found ' + count + ' accounts');

// Select the inserted accounts in a SOQL For Loop
for (List<Account> accounts : [SELECT Name FROM Account WHERE Name LIKE 'Acc%']) {
    System.debug(accounts.size());
}

// To be tidy - get rid of the inserted accounts
//delete [SELECT Id FROM Account WHERE Name LIKE 'Acc%'];
delete accs;
// sObjects fetched by SOQL are commonly stored in a list
List<Case> cases = [SELECT CaseNumber FROM Case];

for (Case aCase : cases) {
    System.debug(aCase);
}

// alternative loop with integer iterator
Integer numCases = cases.size();
for (Integer i = 0; i < numCases; i++) {
    System.debug(cases[i]);
}

// Can use a map (not necessary to include Id in the select as implied)
Map<ID,Account> mapAccounts = new Map<ID,Account>([SELECT Id, Name FROM Account]);
for (Account acc : mapAccounts.values()) { 
  System.debug('>>>>>>>>>>>>>>> Current Account: ' + acc.Name);
}

for (ID Id : mapAccounts.keySet()) { 
  System.debug('*************** Current Account: ' + mapAccounts.get(Id).Name);
}
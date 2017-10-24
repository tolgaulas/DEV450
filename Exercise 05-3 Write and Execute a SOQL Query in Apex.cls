//TASK 1: Retrieve a single case.

//TODO: Write an Apex statement that:
//       - Declares a variable of type Case named aCase and assign it the value of a SOQL query that
//         - Selects the Subject field
//         - From the Case sObject
//         - Where the value of the Id field of the Case sObject equals the Id you retrieved from the salesforce UI
//Case aCase = [SELECT Subject FROM Case WHERE Id='5002400000PnJvuAAF'];
Case aCase = [SELECT Subject FROM Case WHERE Id='5002400000PnJvu'];
System.debug(aCase);

// If you need to convert from 15char Id to 18char Id do this:
String Id15 = '5002400000PnJvu';
Id Id18 = (Id)Id15;
System.debug(Id18);

//--------------------------------------------------------------------------------------------
//TASK 2: Retrieve multiple cases.

//TODO: Write an Apex statement that:
//       - Declares a variable whose type is a List of Case sObjects named cases and assign it the value of a SOQL query that
//         - Selects the Id field
//         - From the Case sObject
List<Case> cases = [SELECT Id From Case];

System.debug('Total number of cases: ' + cases.size());
for (Case c : cases) {
    System.debug(c);
}
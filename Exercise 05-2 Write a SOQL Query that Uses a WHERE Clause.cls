SELECT CaseNumber, Id, IsClosed, Product_Category__c, Priority, Status, Subject 
  FROM Case

//--------------------------------------------------------------------------------------------
//TASK 1: Retrieve all closed Cases.
//--------------------------------------------------------------------------------------------
SELECT Id, Type, RecordTypeId, Status, Subject, Priority, 
       IsClosed, ClosedDate, CreatedDate, Product_Category__c
    FROM Case 
    WHERE IsClosed = TRUE

//--------------------------------------------------------------------------------------------
//TASK 2: Retrieve all Cases that do not have a specified type.
//--------------------------------------------------------------------------------------------
SELECT Id, Type, RecordTypeId, Status, Subject, Priority, 
       IsClosed, ClosedDate, CreatedDate, Product_Category__c
    FROM Case 
	WHERE Type = NULL
	
//--------------------------------------------------------------------------------------------
//TASK 3: Retrieve all high-priority Cases that involve particular products.
//--------------------------------------------------------------------------------------------
SELECT Id, Type, RecordTypeId, Status, Subject, Priority, 
       IsClosed, ClosedDate, CreatedDate, Product_Category__c
    FROM Case 
	WHERE Priority = 'High'
		AND Product_Category__c = 'Printers'
	
//--------------------------------------------------------------------------------------------
//TASK 4: Retrieve all Cases with a subject containing “Printer.”
//--------------------------------------------------------------------------------------------
SELECT Id, Type, RecordTypeId, Status, Subject, Priority, 
       IsClosed, ClosedDate, CreatedDate, Product_Category__c
    FROM Case 
	WHERE Subject LIKE '%printer%'
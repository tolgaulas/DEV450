trigger CourseDeliveryTrigger on Course_Delivery__c (before insert, before update) {
    System.debug('NEW' + trigger.new);
    System.debug('OLD' + trigger.old);
}

// Create a Course Delivery with a start date of Feb 2, 2020
11:42:53:083 USER_DEBUG [30]|DEBUG|NEW(Course_Delivery__c:{Id=null, IsDeleted=false, Name=null, 
	CurrencyIsoCode=USD, CreatedDate=null, CreatedById=null, LastModifiedDate=null, LastModifiedById=null, 
	SystemModstamp=null, LastActivityDate=null, LastViewedDate=null, LastReferencedDate=null, 
	Start_Date__c=2020-02-02 00:00:00, Region__c=APAC, Location__c=Tokyo, JP, Instructor__c=null, 
	Status__c=Scheduled, Course__c=a0061000002TmxbAAC, Attendee_Count__c=0, 
	End_Date__c=2020-02-06 00:00:00})
11:42:53:083 USER_DEBUG [31]|DEBUG|OLDnull

// Update the inserted Course Delivery's start date to March 2, 2020
11:43:54:096 USER_DEBUG [30]|DEBUG|NEW(Course_Delivery__c:{Id=a01610000021fVAAAY, IsDeleted=false, 
	Name=DELIVERY-00035, CurrencyIsoCode=USD, CreatedDate=2015-11-06 11:42:53, CreatedById=0056100000180BdAAI, 
	LastModifiedDate=2015-11-06 11:42:53, LastModifiedById=0056100000180BdAAI, SystemModstamp=2015-11-06 11:42:53, 
	LastActivityDate=null, LastViewedDate=null, LastReferencedDate=null, 
	Start_Date__c=2020-03-02 00:00:00, Region__c=APAC, Location__c=Tokyo, JP, Instructor__c=null, 
	Status__c=Scheduled, Course__c=a0061000002TmxbAAC, Attendee_Count__c=0, 
	End_Date__c=2020-03-06 00:00:00})
11:43:54:097 USER_DEBUG [31]|DEBUG|OLD(Course_Delivery__c:{Id=a01610000021fVAAAY, IsDeleted=false, 
	Name=DELIVERY-00035, CurrencyIsoCode=USD, CreatedDate=2015-11-06 11:42:53, CreatedById=0056100000180BdAAI, 
	LastModifiedDate=2015-11-06 11:42:53, LastModifiedById=0056100000180BdAAI, SystemModstamp=2015-11-06 11:42:53, 
	LastActivityDate=null, LastViewedDate=null, LastReferencedDate=null, 
	Start_Date__c=2020-02-02 00:00:00, Region__c=APAC, Location__c=Tokyo, JP, Instructor__c=null, 
	Status__c=Scheduled, Course__c=a0061000002TmxbAAC, Attendee_Count__c=0, 
	End_Date__c=2020-02-06 00:00:00})
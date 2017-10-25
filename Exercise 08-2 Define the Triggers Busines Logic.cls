trigger CourseDeliveryTrigger on Course_Delivery__c (before insert, before update) {
    
    //TODO #1: Review the for loop to see how we are populating allHolidays 
    //         We have assumed that there are no recurring Holidays, for simplicity's sake.
    Set<Date> allHolidays = new Set<Date>();
    for (List<Holiday> holidays : [SELECT ActivityDate FROM Holiday]) {
        for (Holiday h : holidays) {
            allHolidays.add(h.ActivityDate);
        }
    }
    
    for (Course_Delivery__c courseDelivery : trigger.new) {

        if (courseDelivery.Start_Date__c != NULL) {

            //TODO #2: Prevent the invoking DML action if the Start Date is in the allHolidays set.
            //         Create an If statement that determines if the Set allHolidays contains the 
            //         courseDelivery Start Date. Use the addError method of the sObject class to 
            //         add the following error to the courseDelivery sObject:
            //         Course Delivery cannot be scheduled because it starts on a holiday.
            if ( allHolidays.contains(courseDelivery.Start_Date__c) ) {
                courseDelivery.addError('Course Delivery cannot be scheduled because it starts on a holiday.');
            }
        }
    }
}

// Add a Holiday on 31st Dec for this year Setup | Company Profile | Holidays
// Create and update a Course Delivery from the UI to test the above trigger code

// Simple test of Holiday logic from anonymous block
Date myDate = Date.newinstance(2016, 12, 31);

Set<Date> allHolidays = new Set<Date>();
for (List<Holiday> holidays : [SELECT ActivityDate FROM Holiday]) {
    for (Holiday h : holidays) {
        allHolidays.add(h.ActivityDate);
    }
}

if ( allHolidays.contains(myDate) ) 
    System.debug('It\'s a holiday');
else
    System.debug('It\'s NOT a holiday');

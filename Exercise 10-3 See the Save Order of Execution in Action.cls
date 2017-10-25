//First part of the exercise we manually create a Course Attendee record using the UI by
//first finding a Scheduled Course Delivery and adding an attendee.

//This fires the CourseAttendee trigger (after insert, after update) which calls
//CourseAttendeeTriggerHandler.provideAccessLMS. This creates a new task for a
//training coordinator user (profile is training user). DML is thus an Insert.

//An update happens on the Course Delivery (it has a RSF counting the number of attendees)
//which fires the CourseDelivery trigger (before insert, before update) to check for a
//holiday clash.

//A Workflow on Course Delivery is also evaluated but does nothing because it only fires
//on Course Delivery create.

//Second part of the exercise involves running CourseDeliveryTrigger_test. This loads a lot
//of data then performs the actual test (verifyBulkAttendees) which loads 205 attendees.

//This fires the CourseAttendee trigger twice (for 200 attendees then for the remaining 5).
//Subsequently each run of CourseAttendee trigger causes an invocation of CourseDelivery trigger
//and the Workflow as before. Workflows only run twice for the test. There are two other runs of the
//but these are caused by loading the test data.

//Tricky to distinguish between calls arising from actual test and this coming from loading
//the test data.
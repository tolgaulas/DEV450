//Exercise has us attempting to set the status of a Course to "Retired" 
//when the course has scheduled deliveries one of which has attendees enrolled.
//There are 7 deliveries in total. Remember MD from Course to Course delivery
//with RSF on Course.

//The Course trigger calls the CheckStatus method which lists the 7 deliveries.
//The one that's Scheduled and has attendees causes the addError.

//Of the 6 remaining the checkstatus method attempts to update the course delivery
//which fires the Course Delivery trigger.
//2 of these are already in the Cancelled state (so no RSF re-calc). The WF is evaluated but does nothing
//4 are not in cancelled so the workflow is evaluated (still does nothing) and the subsequent 
//re-calculation of the RSF on Course causes an update on the Course record which re-fires the Course
//trigger (which does nothing).

//Save Order shows the Course_Delivery update happening 6 times, 2 of which do not re-fire
//the Course trigger
//
// *** Not sure why Save Order has Course_Delivery update followed by Course_Delivery__c updates
// *** (why not __c on the first entry????)
//
//Execution log has 6 DML updates
//Execution tree also shows 6 Course_Delivery__c updates BUT in latest run didn't show the addError call.
//Had to search the log for "Scheduled" and then step down a bit to see the addError call in the source
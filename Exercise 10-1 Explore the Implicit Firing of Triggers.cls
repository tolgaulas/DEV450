//Exercise has us set the status of a Course to retired. Course has a couple
//of deliveries.

//Course trigger (after update) fires and checkstatus method attempts to update the 2 course deliveries
//to 'Cancelled'. The update causes the Course Delivery trigger to fire, a workflow to be
//evaluated (does nothing because only runs on create) AND, because there are RSF on Course
//a further update on the Course record which re-fires the Course Trigger (does nothing).

//Save order shows this nicely as does execution tree.
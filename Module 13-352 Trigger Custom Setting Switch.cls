/* Create a new List Custom Setting called TriggerSwitch
 *
 * Setup | Develop | Custom Settings
 *
 * Label:    Trigger Switch
 * Name:     TriggerSwitch
 * API Name: TriggerSwitch__c
 *
 * Add new checkbox custom field called Active Flag (API name Active_Flag__c, default value true)
 *
 * Manage custom setting - add new entry
 *
 * Name:           CourseDeliveryTrigger
 * Active_Flag__c: True
 *
 * Modify CourseDeliveryTrigger code as follows:
 */
trigger CourseDeliveryTrigger on Course_Delivery__c (before insert, before update) {
    
    // Only call business logic if custom setting switch allows it. 
    // Note: Check for a null custom setting as not visible to testMethod 
    TriggerSwitch__c tsw = TriggerSwitch__c.getInstance('CourseDeliveryTrigger');
    if ( tsw == null || tsw.Active_Flag__c ) {
		CourseDeliveryTriggerHandler.preventInvalidCourseDeliveries(trigger.new);       
    }
}

// Test that it still works. Change value of Active_Flag__c to False and check that
// business logic no longer runs
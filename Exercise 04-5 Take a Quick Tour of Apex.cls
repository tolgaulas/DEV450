public class CourseManager {

	/**
	 *  This class contains methods used to manage records in the Course object
	 */
	 
    public static Set<Course__c> findDuplicates (List<Course__c> oldCourseList, List<Course__c> newCourseList) {
        
		/** TODO #1: Declare a variable whose type is a Set of Course__c sObjects named courseDuplicatesSet
		 *           and initialize it to a newly constructed Set of Course__c sObjects, passing in no parameters
		 */
		Set<Course__c> courseDuplicatesSet = new Set<Course__c>();
		
		/** TODO #2: Declare a variable whose type is a Set of Course__c sObjects named oldCourseSet
		 *           and initialize it to a newly constructed Set of Course__c sObjects, passing in
		 *           the oldCourseList (from the input parameter of the method) as a parameter.
		 */
        Set<Course__c> oldCourseSet = new Set<Course__c>(oldCourseList);
		
		/** TODO #3: Create a for loop with an iterator of type Course__c named newCourse that
		 *           iterates over the List newCourseList (from the input parameter of the method).
		 *           Within the for loop:
		 *           -- If the oldCourseSet variable contains the value in the newCourse variable:
		 *              -- Call the add method for the courseDuplicatesSet variable and pass in the
		 *                 value of the newCourse variable       
		 */
        for (Course__c newCourse : newCourseList) {
            if (oldCourseSet.contains(newCourse)) {
                courseDuplicatesSet.add(newCourse);
            }
        } 
		
		/** TODO #4: Return the courseDuplicatesSet variable
		 */
        return courseDuplicatesSet;
    }
}

@isTest
private class CourseManager_Test {    
    
    private static List<Course__c> createTestDataCourses(Integer startValue, Integer endValue) {
        List<Course__c> coursesToAdd = new List<Course__c>();
        for (Integer i = startValue; i <= endValue; i++) {
            Course__c course = new Course__c(name='Course ' + i);
            coursesToAdd.add(course);
        }
        return coursesToAdd;
    }
    
    static testMethod void testFindDuplicates () {
        List<Course__c> oldCourses = createTestDataCourses(0, 5);
        List<Course__c> newCourses = createTestDataCourses(3, 6);
        Test.startTest();
        Set<Course__c> duplicateCourses = CourseManager.findDuplicates(oldCourses, newCourses);
        Test.stopTest();
        System.assert(duplicateCourses.size()==3);
    }
}
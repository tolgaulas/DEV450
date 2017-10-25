public class MyClass {
    // A final class variable can be assigned only at declaration or in a constructor
    public final Integer FINAL_VAR1;
    public final Integer FINAL_VAR2 = 2;

    // A static final variable can be assigned at declaration or in a static initialization
    public final static Integer STATIC_FINAL_VAR3;
    public final static Integer STATIC_FINAL_VAR4 = 4;

    // Static initialization
    Static {
        STATIC_FINAL_VAR3 = 3;
    }

    // Constructor
    Public MyClass() {
        FINAL_VAR1 = 1;
    }
}



public class HelloWorld {
    
    public String memberVariable;
    public final String finalVariable;
    public static String staticVariable;
	
    // Constructor (no args)
    public HelloWorld() {
        memberVariable = 'Default';
        finalVariable = 'Constant1';
    }
    
    // Constructor (single string arg)
    public HelloWorld(String value) {
        memberVariable = value;
        finalVariable = 'Constant2';
    }
    
	public void printMemberVariable() {
		System.debug('Hello ' + memberVariable);
        System.debug('Hello ' + finalVariable);
	}
    
	public static void printStaticVariable() {
		System.debug('Hello ' + staticVariable);
	}
}

// From Anonymous block
// Instantiate and set memberVariable
HelloWorld hw1 = new HelloWorld();
hw1.memberVariable = 'Simon';
hw1.printMemberVariable(); // Output is Hello Simon and Hello Constant1

// Instantiate and set memberVariable using constructor
HelloWorld hw2 = new HelloWorld('World');
hw2.printMemberVariable(); // Output is Hello World and Hello Constant2

// Static variable and method so don't have to create an instance of the class
HelloWorld.staticVariable = 'Bert';
HelloWorld.printStaticVariable(); // Output is Hello Bert

// Try to set the final variable - won't end well!
//hw1.finalVariable = 'Problem';

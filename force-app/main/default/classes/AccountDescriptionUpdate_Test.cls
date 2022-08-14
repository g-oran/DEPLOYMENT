@isTest
public class AccountDescriptionUpdate_Test {
	@TestSetup //out of class is not available
	public static void testMethod_Test(){
		Account acc = new Account(Name = 'Test');
		insert acc;
		Account accnew = new Account(Name = 'Test');
		insert accnew;
	}
    
    @isTest
	public static void updateDescription_Test(){
		Account acc = [Select Id from Account limit 1];
		AccountDescriptionUpdate.updateDescription(acc);
		System.assertEquals('Updated Account', acc.Description);
	}
	@isTest
	public static void updateDescription_Test1(){
		Account accnew = [Select id from Account limit 1];
		AccountDescriptionUpdate.updateDescription(accnew);
		System.assertEquals('Updated Account', accnew.Description);
	}
}
//Create own data in every method
//Create all data in @TestSetup and use them in different methods in same class
//Test Data Utility class. Data source for every test classes
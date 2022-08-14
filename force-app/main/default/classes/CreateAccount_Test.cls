@isTest
public class CreateAccount_Test { //150DML
	@isTest
	public static void createAccountMethod_Test(){
		Test.startTest(); //150DML
		CreateAccount.createAccountMethod();
		System.assertEquals(1, Limits.getDmlStatements());
		System.debug(Limits.getDmlStatements());
		Test.stopTest(); //149DML
		System.debug(Limits.getDmlStatements()); //150DML
}
}
@isTest
public class ContactUpdate_Test {
	// create test data
	@TestSetup
    public static void createData_Test(){
        List<Account> newAccs = new List<Account>();
        for(Integer i = 1; i<6; i++){
            Account a = new Account(Name = 'Test Account ' + i); //Test Account 1, Test Account 2
        	newAccs.add(a);
        }
        insert newAccs; // 5 accounts with their ids
        system.debug(newAccs);
        system.debug(newAccs.size());
        List<Contact> newCons = new List<Contact>();
        for(Account ac : [Select Id from Account]){
            for(Integer j = 1; j<3; j++){
            	Contact c = new Contact(LastName = 'Test Contact ' + j, AccountId = ac.Id); //Test Contact 1, Test Contact 2
        		newCons.add(c);
        	}
        }
       insert newCons; // 2 contacts with ids
       system.debug(newCons);
       system.debug(newCons.size());
  }
   @isTest
    public static void singleUpdate_Test(){
        Account accnt = [Select Id, Name, Description from Account limit 1];
        accnt.Description = 'I just updated this field.';
        update accnt;
        for(Contact cnt : [Select Description, AccountId from Contact where AccountId =: accnt.Id ]){
            system.assertEquals('I just updated this field.', cnt.Description);
        }
    }
    @isTest
    public static void multipleUpdate_Test(){
        List<Account> updatedList = new List<Account>();
        for(Account ac : [Select Description from Account]){
            ac.Description = 'Updated';
            updatedList.add(ac);
        }
        update updatedList;
        for(Contact con : [Select Description, Account.Description from Contact]){
            system.assertEquals(con.Account.Description, con.Description);
        }
    }
}
@isTest
public class UpdatePhone_Test {
    @TestSetup
    public static void createData_Test(){
    List<Account> accs = new List<Account>();
    for(Integer i = 1; i<6; i++){
        Account a = new Account(Name='Test '+ i, Phone = '55555555' + i); //Test 1, 555555551 - Test 2, 555555552
        accs.add(a);
    }
    insert accs; // 5 unique accounts and related phones
    }
    @isTest
    public static void createContact_Test(){
        Contact c = new Contact(LastName = 'Test Contact 1', AccountId = [Select Id from Account Where Name = 'Test 1' limit 1].id); // Account.Id
        insert c; // execute trigger
        system.debug([Select otherphone from contact where id = :c.id].otherphone);
        system.assertEquals('555555551', [Select otherphone from contact where id = :c.id].otherphone);
    }
    @isTest
    public static void createContactMulti_Test(){
        List<Contact> conList = new List<Contact>();
        for(Integer i = 1; i<4; i++){
            Contact c = new Contact(LastName = 'Test Contact 1', AccountId = [Select Id from Account Where Name = 'Test 1' limit 1].id);
       		conList.add(c);
        }
        insert conList;
        system.debug(conList.size());
        for(Contact con : [Select OtherPhone, Account.Phone from Contact]){
            system.assertEquals(con.Account.Phone, con.OtherPhone);
    	}
	}
}
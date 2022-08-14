@isTest
public class AddContact_Test {
@isTest
    public static void conList(){
        List<Account> a = new List<Account>();
        for(Integer i =1; i<=50 ; i++){
    Account acct = new Account();
    acct.Name = 'Ridvan Wedding Corporation ' + i;
          a.add(acct);
        }
    insert a;
        List<Contact> conList =[ SELECT Id, LastName from contact WHERE LastName LIKE '%Ridvan%'];
        System.assertEquals(50, conList.size());
    List<Account> accs = [SELECT Id, Name FROM Account];
    List<Contact> cons = [SELECT AccountId, LastName FROM Contact];
        for(Account ac : accs){
            for(Contact c : cons){
                if(ac.Id == c.AccountId){
                   Integer i = 0;
                   System.assertEquals(ac.Name, c.LastName);
                   i++;
                   system.debug(i);
               		System.assertEquals(1, i);
                }
            }
        }
}
}
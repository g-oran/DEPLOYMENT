public class SoqlTest {
    public static void myTest(){
        List<Account> oldAccs = [select name, description from account where name = 'sForce'];
        List<Account> newList = new List<Account>();
        for(Account acc : oldAccs){
            acc.Description = 'test';
            newList.add(acc);
        }
        update newList;
    }
}

//we can call with: SoqlTest.myTest();

//or we can put SOQL query in the for loop

/*public class SoqlTest {
    public static void myTest(){
        List<Account> newList = new List<Account>();
        for(Account acc : [select name, description from account where name = ‘ztest’]){
            acc.Description = ‘test1’;
            newList.add(acc);
        }
        update newList;
    }
}
*/
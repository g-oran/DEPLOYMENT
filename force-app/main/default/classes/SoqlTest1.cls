//Binding Variable

public class SoqlTest1 {
    public static void myTest1(String str){
        List<Account> newList = new List<Account>();
        for(Account acc : [select name, description from account where name =: str]){
            acc.Description = 'test2';
            newList.add(acc);
        }
        update newList;
    }


//we can call with: SoqlTest1.myTest1('sForce);
//
//
//Dynamic Query

	public static void dynamicQuery(String fieldName){
        String a = 'Select ' + fieldName + ' from Account';
        List<Account> listAcc = Database.query(a);
    }
}

//we can call with: SoqlTest1.dynamicQuery('Name');
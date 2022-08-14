public class CreateAccount {
	public static void createAccountMethod(){
		List<Account> listAcc = new List<Account>();
    	for(Integer i = 1; i<4; i++){
			Account acc = new Account(Name = 'Test '+ i);//Test 1, Test 2, Test 3
			listAcc.add(acc);
		}
		insert listAcc;
    }
}
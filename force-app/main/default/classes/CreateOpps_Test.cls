@isTest
public class CreateOpps_Test {
    @isTest
    public static void opp_Test(){
        // Create data to execute trigger
		Account a = new Account();
        a.Name = 'Test Account';
        a.Industry = 'Education';
        a.Rating = 'Warm';
        insert a;
        // Check assertions
        Opportunity o = [SELECT Name FROM Opportunity WHERE Name = 'Test Account' LIMIT 1];
        System.assertEquals('Test Account', o.Name, 'Opp Name is not correct!');
        // Check email
		Integer invocations = Limits.getEmailInvocations();
        System.assertEquals(1, invocations, 'Email not invoked!');
    }
}
//https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_SOSL.htm
//If we have SOOL querry in class, Test class doesn't work right. We need to copy and Paste the code from above link and adjust.

/* List<Id> fixedSearchResults = new List<Id>(1);
   fixedSearchResults.add(ld.id);
   Test.setFixedSearchResults(fixedSearchResults);*/
//veya

/* Id [] fixedSearchResults= new Id[1];
   fixedSearchResults[0] = ld.id;
   Test.setFixedSearchResults(fixedSearchResults);*/

@isTest
public class BankUpdate_Test {
    @isTest
    public static void bankUpdate_Test(){
        // Create test data
        Lead ld = new Lead();
        ld.LastName = 'Test';
        ld.Company = 'Banking';
        insert ld;
        
        // Executing condition
       // Id [] fixedSearchResults = new Id[1];
       // //fixedSearchResults[0] = ld.id;
        List<Id> fixedSearchResults = new List<Id>(1);
        fixedSearchResults.add(ld.id);
        Test.setFixedSearchResults(fixedSearchResults);
        
        BankUpdate.bankDescUpdate();
        
        // Checking assertion
        Lead updatedLead = [SELECT Description FROM Lead WHERE LastName = 'Test'];
        System.assertEquals('Banking Industry', updatedLead.Description);
    }
}
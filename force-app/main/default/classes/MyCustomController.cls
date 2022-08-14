public class MyCustomController {
    public Account getAccount(){
       Account acc = [SELECT Id, Name, Phone FROM Account WHERE Id =: ApexPages.currentPage().getParameters().get('Id')];
       return acc;
    }
}
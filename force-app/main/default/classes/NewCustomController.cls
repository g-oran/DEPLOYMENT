public class NewCustomController {
    public Account acc {get; set;}
    public NewCustomController(){
        acc = [SELECT Id, Name, Industry FROM Account WHERE Id =: ApexPages.currentPage().getParameters().get('Id')];
    }
    public PageReference save(){
        upsert acc;
        return null;
    }
 }
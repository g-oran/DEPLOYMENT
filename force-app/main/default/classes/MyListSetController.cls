public class MyListSetController {
    public List<Contact> getContacts(){
        List<Contact> cons = [SELECT Id, LastName, Email, Phone FROM Contact];
        return cons;
    }
}
public class BankUpdate {
    
    //@invocableMethod -- when we want to edit page and add screen flow to run this class. 
    //Flow--> Add Element--> Action--> Change 'Filter By' from 'Category' to 'Type'--> Apex Action    
    
    @invocableMethod
    public static void bankDescUpdate(){
        // find data and bring to table - SOSL
        List<List<sObject>> results = [FIND 'Bank*' RETURNING Lead(Id, Description)];
        List<Lead> returnedLeads = (List<Lead>)results[0];
        system.debug(returnedLeads);
        List<Lead> updatedLeads = new List<Lead>();
        // work on data - update description field/fields
        for(Lead l : returnedLeads){
            l.Description = 'Banking Industry';
            updatedLeads.add(l);
            system.debug(l.Description);
        }
       system.debug(updatedLeads.size());
        // save it to database - update DML
        update updatedLeads;
    }
}
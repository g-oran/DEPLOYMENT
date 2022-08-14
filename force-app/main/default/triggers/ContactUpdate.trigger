trigger ContactUpdate on Account (before update) {
    // Updated Contacts
    List<Contact> updatedList = new List<Contact>();
    // Execution
    for(Contact c : [Select AccountId, Description from Contact where AccountId != null]){
        for(Account a : Trigger.new){
            if(c.AccountId == a.Id){ // linked together parent / child
               c.Description = a.Description;
               updatedList.add(c);
            }
        }
    }
    // write to the db
    update updatedList;
}
//
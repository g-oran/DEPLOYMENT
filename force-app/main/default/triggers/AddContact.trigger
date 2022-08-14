trigger AddContact on Account (after insert) {
	
    List<Contact> contacts = new List<Contact>();
    for(Account acct : Trigger.new){
        Contact c = new Contact();
        c.LastName = acct.Name;
        c.AccountId = acct.Id;
        contacts.add(c);
    }
    insert contacts;
}
trigger ContactPhone on Contact (after insert) {
    List<Contact> Cons = [Select name, otherphone, AccountId, Account.phone from Contact where id In :Trigger.New];
    List<Contact> updatedCons = new List<Contact>();
    for(Contact c : Cons){
        if(c.OtherPhone != c.Account.phone){
           c.OtherPhone = c.Account.phone;
           updatedCons.add(c);
        }
    }
    update updatedCons;
}
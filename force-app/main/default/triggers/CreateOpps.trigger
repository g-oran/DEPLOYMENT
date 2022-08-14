/*
 	Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    email.setToAddresses(recipientList);
    email.setSubject(subject);
    email.setPlainTextBody(emailBody);
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
*/
trigger CreateOpps on Account (after insert) {
	List<Opportunity> createdOpps = new List<Opportunity>();
    // Retrieve Trigger.new data and iterate over on list, check condition (INDUSTRY as EDUCATION and RATING as WARM)
    for(Account a : Trigger.new){
        if(a.Industry == 'Education' && a.Rating == 'Warm'){
           // Create Opp with Account Id, create additional fields
           Opportunity opp = new Opportunity();
           opp.Name = a.Name;
           opp.CloseDate = System.today()+15;
           opp.Description = 'Created by Trigger';
           opp.StageName = 'Qualification';
           opp.AccountId = a.Id;
            createdOpps.add(opp);
	
    // Send email to a static email
     	List<String> recipientList = new List<String>();
    	recipientList.add('gokmenoran@hotmail.com');
    	String subject = 'Opp Test Email';
    	String emailBody = 'This is email body.';
    	Messaging.SingleEmailMessage b = new Messaging.SingleEmailMessage();
        b.setToAddresses(recipientList);
        b.setSubject(subject);
        b.setPlainTextBody(emailBody);
    // 	email.setOrgWideEmailAddressId(‘0D28c000000GqWE’); -- in user settings, need id of user's email address
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {b});
        }
    }
    insert createdOpps;
}
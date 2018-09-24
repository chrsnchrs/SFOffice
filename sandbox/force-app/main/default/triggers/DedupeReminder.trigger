trigger DedupeReminder on Account (after insert) {

    for (Account acc : Trigger.new){
         Case c = new Case();
         c.Subject = 'Dedupe this Account';
         c.OwnerId = '00541000002T8ICAA0';
         c.AccountId = acc.Id;
         insert c;
    }


}
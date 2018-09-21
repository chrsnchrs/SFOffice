trigger AccountToCase on Account (after insert) {
    for (Account a : Trigger.new){
        Case c = new Case();
        c.Subject = 'Dedupe this account';
        c.AccountID = a.id;
        c.OwnerID = '00541000004VSRGAA4';
        insert c;
    }
}
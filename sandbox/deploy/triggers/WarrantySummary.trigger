trigger WarrantySummary on Case (before insert) {
    
    string endingstatement = 'Have a nice day!';

    for (Case mycase : Trigger.new){

        string casenumber = mycase.casenumber;
        string reason = mycase.reason;
        datetime createddate = Date.today();

        mycase.description = 'This is test line 1 ' + casenumber + '.\n'
                            + 'This is test line 2 ' + reason + '.\n'
                            + 'This is test line 3 ' + createddate + '\n'
                            + endingstatement;

    }
}
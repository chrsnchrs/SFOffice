@istest

private class WarrantySummaryTest {
    
    @istest static void WarrantySummaryTest() {

        Case NewCase = new Case();

        NewCase.reason = 'TestReason';
        //NewCase.name = 'TestName';

        insert NewCase;
        
    }
}

@istest 
private class AppleWatchTest {
   @isTest static void AppleWatchTest() {
        Opportunity opp = new Opportunity();
        opp.Name = 'Swift Deal';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();

        insert opp;
    }
}

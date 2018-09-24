public class MAG_CreateFeeBilling {
    
    public class ReceiveValues{
        @InvocableVariable(label='Account Id' required=true)
        public id accountId;
        
        @InvocableVariable(label='Policy Id' required=true)
        public id policyId;
        
        @InvocableVariable(label='Rate' required=true)
		public decimal rate;
    }
    
    @InvocableMethod(label='Post Billings')
        public static void PostBillings(ReceiveValues[] values){
            AcctSeed__Billing__c[] billings = new List <AcctSeed__Billing__c> ();
            billings.add(
                new AcctSeed__Billing__c(
                    AcctSeed__Date__c = System.today(),
                    AcctSeed__Customer__c = values[0].accountId,
                    CanarySeed__Policy__c = values[0].policyId,
                    AcctSeed__Status__c = 'Approved'
               )
            );
            insert billings;
            
            // Create billing line records to post and unpost
            AcctSeed__Billing_Line__c[] bLines = new List <AcctSeed__Billing_Line__c> ();
            
            for (AcctSeed__Billing__c bill : billings) {
                AcctSeed__Billing_Line__c objBillingLine = new AcctSeed__Billing_Line__c();
                objBillingLine.AcctSeed__Billing__c = bill.id;
                objBillingLine.AcctSeed__Date__c = System.today();
                objBillingLine.AcctSeed__Rate__c = values[0].rate;
                objBillingLine.AcctSeed__Hours_Units__c = 1;
                objBillingLine.AcctSeed__Revenue_GL_Account__c = 'a2841000000P9LVAA0';
                bLines.add(objBillingLine);
            }
            
            insert bLines;
            
    // Call the post billings service
    AcctSeed.PostResult[] postResults = AcctSeed.BillingPostService.postBillings(billings);
    
    // Loop through post results
    for (AcctSeed.PostResult theResult : postResults) {
        if (theResult.isSuccess) {
            System.debug('Successfully posted billing: ' + theResult.id);
        } 
        else {
            System.debug('Error posting billing ' + theResult.id);
            for (AcctSeed.PostResult.PostErrorResult errorResult: theResult.errors) {
                System.debug('Error status code ' + errorResult.statusCode);
                System.debug('Error message ' + errorResult.message);
            }
        }
    }
	}
}
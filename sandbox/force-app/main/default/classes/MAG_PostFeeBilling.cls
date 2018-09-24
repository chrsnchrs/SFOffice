public class MAG_PostFeeBilling {

    public class BillingSfid {
        @InvocableVariable(label='Billing Id' required=true)
        public Id billingId;
    }
    
    @InvocableMethod(label='Post Billings')
    public static void postBilling(BillingSfid[] billingSfids) {
	//public static void postBilling(list<Billing__c> billingSfids) {
		string auth = UserInfo.getSessionId();       
       // httpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        
   		MAG_FuturePostBilling.acctseedPostBilling(billingSfids[0].billingId,auth);
        }
}
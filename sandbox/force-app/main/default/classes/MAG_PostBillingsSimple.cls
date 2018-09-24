public with sharing class MAG_PostBillingsSimple {

    public class BillingSfid {
        @InvocableVariable(label='Billing Id' required=true)
        public Id billingId;
    }
    
    @InvocableMethod(label='Post Billings')
    public static void postBilling(BillingSfid[] billingSfids) {
    //public static void addBillingID(List<billingsfid> Ids) {
	//	Billing[] billings = new Billing[]();
   //   List<Id> billingids = new List<Id>();
   		String bsfid;
   	    for(BillingSfid b : billingSfids) bSfid=b.billingId;
        String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm();
        String restAPIURL = sfdcURL + '/services/apexrest/AcctSeed/v1.0/billing/post/' + bSfid; 

        HttpRequest httpRequest = new HttpRequest(); 
        httpRequest.setMethod('POST');  
        httpRequest.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());       
        httpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        httpRequest.setEndpoint(restAPIURL); 

        String response = '';
        try { 
            Http http = new Http();  
            HttpResponse httpResponse = http.send(httpRequest); 
            if (httpResponse.getStatusCode() == 200 ) { 
                response = JSON.serializePretty( JSON.deserializeUntyped(httpResponse.getBody()) ); 
            } else { 
                System.debug(' httpResponse ' + httpResponse.getBody() ); 
                throw new CalloutException( httpResponse.getBody() ); 
            }  
        } catch( System.Exception e) { 
            System.debug('ERROR: '+ e); 
            throw e; 
            } 
        System.debug(' ** response ** : ' + response ); 
        
     //   return billingids;
   }
}
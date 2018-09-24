public class MAG_FuturePostBilling {

    @future(Callout=true)
//    public acctseedPostBilling(string billingId){
    public static void acctseedPostBilling(string billingId,string auth){
    	String bsfid=billingId;
        String oath=auth;
   	    //for(BillingSfid b : billingSfids) bSfid=b.billingId;

    	String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm();
        String restAPIURL = sfdcURL + '/services/apexrest/AcctSeed/v1.0/billing/post/' + bSfid; 

        HttpRequest httpRequest = new HttpRequest(); 
        httpRequest.setMethod('POST');  
       // httpRequest.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());       
       // httpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        httpRequest.setHeader('Authorization', 'OAuth ' + oath);       
        httpRequest.setHeader('Authorization', 'Bearer ' + oath);
       
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
      
    }
    //return response;
}
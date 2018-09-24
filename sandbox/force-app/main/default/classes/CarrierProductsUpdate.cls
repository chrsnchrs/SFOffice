public with sharing class CarrierProductsUpdate {
    public static void CarrierProductsUpdate() {
        
        canaryams__carrier_product__c CPToUpdate;
        try {
            //insert accts;        
            
            // Update account Acme2.
            cpToUpdate = 
                [SELECT CanaryAMS__Product_Code__c FROM canaryams__carrier_product__c 
                WHERE ID = 'a0J4100000FAuGaEAL'
                LIMIT 1];
            // Update the billing city.
            cpToUpdate.CanaryAMS__Product_Code__c = 'CJC';
            // Make the update call.
            update cpToUpdate;
        } catch(DmlException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}

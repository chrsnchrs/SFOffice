@istest
public with sharing class CarrierProductsIfTestTest {
    @istest static void CarrierProductsIfTestTest() {
        canaryams__carrier_product__c cp = new canaryams__carrier_product__c();
            string sm = '15.0';
            decimal md = Decimal.valueOf(sm);
            cp.name = 'SF Test Name';
            cp.canaryams__carrier__c = 'a024100000cGfaPAAS';
            cp.canaryams__new_business_commission__c = md;

            insert cp;

    }
}
trigger CarrierProductIfTest on canaryams__carrier_product__c (before insert, before update) {

    for (canaryams__carrier_product__c cp : trigger.new){
        if (cp.CanaryAMS__New_Business_Commission__c != null){
            if (cp.CanaryAMS__New_Business_Commission__c > 1.0 && cp.CanaryAMS__New_Business_Commission__c < = 14.99){
                
                cp.mag_bonus__c = decimal.valueOf('8');

                //update cp;
            } else if (cp.CanaryAMS__New_Business_Commission__c >= 15.0 && cp.CanaryAMS__New_Business_Commission__c < = 19.99){
                cp.mag_bonus__c = decimal.valueOf('10');
            }
        } else  cp.mag_bonus__c = decimal.valueOf('0');

    }

}
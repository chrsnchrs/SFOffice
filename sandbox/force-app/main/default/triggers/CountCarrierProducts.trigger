trigger CountCarrierProducts on canaryams__carrier_product__c (before insert) {
    //creates the container as a set because we want only unique records AND we only
    //want the count - we don't need individual record results
    set<string> carprodCount = new set<string>();
    //uses the trigger to insert ALLLL names from cpd object into the container
    for (canaryams__carrier_product__c cntCP : trigger.new){
        carprodCount.add(cntCP.name);

    }
    //counts up all the entries in the container
    carprodCount.size();

}
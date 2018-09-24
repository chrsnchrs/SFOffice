trigger FindCarrierProductBonus on canaryams__carrier_product__c (before insert) {
    //this creates the empty container that will hold the resultset
    //it looks like the entries are restricted to decimal though
    //wonder how it works for multiple entries
    list<decimal> carprodBonus = new list<Decimal>();
    //once the container is created this uses the trigger event (trigger.new)
    //and inserts ALLLL the bonus amounts into the container (list)
    for (canaryams__carrier_product__c cpb : trigger.new){
        carprodBonus.add(cpb.mag_bonus__c);

    }
    // sort the collection to find the smallest bonus
    carprodBonus.sort();
    // when using the list container you can retrive the information by using get
    carprodBonus.get(0);
}
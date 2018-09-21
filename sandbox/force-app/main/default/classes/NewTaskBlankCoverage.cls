public with sharing class NewTaskBlankCoverage {
    public NewTaskBlankCoverage() {

        List<CANARYAMS__POLICY__C> policyList = [select id, MAG_Auto_Coverage_Type__c, canaryams__policy_term__c
          from canaryams__policy__c where id = 'a0A4100000IVNIKEA5'];
        




    }
}

public with sharing class fetchWaterSaved {
    @AuraEnabled(Cacheable=true)

    public static Integer fetchWaterSaved() {

        decimal theSavings;
        String acctId;
        String userId = UserInfo.getUserId();
        RecordType rt = [SELECT id from RecordType WHERE DeveloperName = 'uniFLOW' LIMIT 1];

        User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

        If (string.isBlank(activeUser.Contact_Account_Id__c )) {
            acctId = activeUser.Test_Acct_Id__c  ;
        } else {
            acctId = activeUser.Contact_Account_Id__c;
        }

        AggregateResult[] groupedResults = [SELECT SUM(Water_Saved_Lifetime_Gallons__c) saved FROM Assets2__c WHERE Account__c = :acctId GROUP by Account__c];

        for(AggregateResult ar: groupedResults){
            theSavings = (decimal)ar.get('saved');
        }

        Integer intSavings = Integer.valueof(theSavings);

        return intSavings;
    }

    @AuraEnabled(Cacheable=true)

    public static Integer fetchWaterSavedLm() {

        decimal theSavings;
        String acctId;
        String userId = UserInfo.getUserId();
        RecordType rt = [SELECT id from RecordType WHERE DeveloperName = 'uniFLOW' LIMIT 1];

        User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

        If (string.isBlank(activeUser.Contact_Account_Id__c )) {
            acctId = activeUser.Test_Acct_Id__c  ;
        } else {
            acctId = activeUser.Contact_Account_Id__c;
        }

        AggregateResult[] groupedResults = [SELECT SUM(Water_Saved__c) saved FROM Assets2__c WHERE Account__c = :acctId GROUP by Account__c];

        for(AggregateResult ar: groupedResults){
            theSavings = (decimal)ar.get('saved');
        }

        Integer intSavings = Integer.valueof(theSavings);

        return intSavings;
    }
}

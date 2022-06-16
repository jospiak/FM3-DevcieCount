public with sharing class fetchDuplexRatio {

    @AuraEnabled(Cacheable=true)

    public static Decimal fetchDuplex() {

        Decimal theRatio;
        String acctId;
        String userId = UserInfo.getUserId();
        RecordType rt = [SELECT id from RecordType WHERE DeveloperName = 'uniFLOW' LIMIT 1];

        User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

        If (string.isBlank(activeUser.Contact_Account_Id__c )) {
            acctId = activeUser.Test_Acct_Id__c  ;
        } else {
            acctId = activeUser.Contact_Account_Id__c;
        }

        AggregateResult[] groupedResults = [SELECT AVG(Duplex_Ratio__c) ratio FROM Assets2__c WHERE Retired__c != true AND Account__c = :acctId GROUP by Account__c];

        for(AggregateResult ar: groupedResults){
            theRatio = (Decimal)ar.get('ratio');
        }

        return theRatio.setScale(1);
    }

    @AuraEnabled(Cacheable=true)

    public static String fetchDuplexDetails() {

        String theMessage;
        Decimal sim;
        Decimal dup;
        String acctId;
        String userId = UserInfo.getUserId();
        RecordType rt = [SELECT id from RecordType WHERE DeveloperName = 'uniFLOW' LIMIT 1];

        User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

        If (string.isBlank(activeUser.Contact_Account_Id__c )) {
            acctId = activeUser.Test_Acct_Id__c  ;
        } else {
            acctId = activeUser.Contact_Account_Id__c;
        }

        AggregateResult[] groupedResults = [SELECT SUM(Simplex_Pages__c) simplex, SUM(Duplex_Pages__c) duplex FROM Assets2__c WHERE Retired__c != true AND Account__c = :acctId GROUP by Account__c];

        for(AggregateResult ar: groupedResults){
            sim = (Decimal)ar.get('simplex');
            dup = (Decimal)ar.get('duplex');
        }

        Integer intsim = Integer.valueof(sim);
        Integer intdup = Integer.valueof(dup);

        System.debug(intsim);
        System.debug(intdup);

        theMessage = 'Duplex Pages('+string.valueof(intdup)+') / (Duplex Pages ('+string.valueof(intdup)+') + Simplex Pages ('+string.valueof(intdup)+')';
        System.debug(theMessage);
        return theMessage;

    }
}
public with sharing class fetchDuplexSavings {
    @AuraEnabled(Cacheable=true)

    public static Decimal fetchDuplexSaved() {

        decimal lastMonth;
        decimal startMonth;
        String acctId;
        String userId = UserInfo.getUserId();
        RecordType rt = [SELECT id from RecordType WHERE DeveloperName = 'uniFLOW' LIMIT 1];

        User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

        If (string.isBlank(activeUser.Contact_Account_Id__c )) {
            acctId = activeUser.Test_Acct_Id__c  ;
        } else {
            acctId = activeUser.Contact_Account_Id__c;
        }

        AggregateResult[] groupedResults = [SELECT SUM(Duplex_Start__c) startmonth, SUM(Duplex_Last_Month__c) lastmonth  FROM Assets2__c WHERE Account__c = :acctId GROUP by Account__c];

        for(AggregateResult ar: groupedResults){
            startMonth = (decimal)ar.get('startmonth');
            lastMonth = (decimal)ar.get('lastmonth');
        }

        Integer intLastMonth = Integer.valueof(lastMonth);
        Integer intStartMonth = Integer.valueof(startMonth);
        Decimal paperCost = .005;
        Decimal theSavings = (intLastMonth - intStartMonth) * paperCost;
        System.debug('lastmonth ('+intLastMonth+') - ('+intStartMonth+') * '+paperCost+' = $'+theSavings);
        System.debug('$'+theSavings);

        return theSavings;
    }

    @AuraEnabled(Cacheable=true)

    public static Decimal fetchDuplexSavedLm() {

        decimal lastMonth;
        String acctId;
        String userId = UserInfo.getUserId();
        RecordType rt = [SELECT id from RecordType WHERE DeveloperName = 'uniFLOW' LIMIT 1];

        User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

        If (string.isBlank(activeUser.Contact_Account_Id__c )) {
            acctId = activeUser.Test_Acct_Id__c  ;
        } else {
            acctId = activeUser.Contact_Account_Id__c;
        }

        AggregateResult[] groupedResults = [SELECT SUM(Last_Month_Duplex__c) lastmonth  FROM Assets2__c WHERE Account__c = :acctId GROUP by Account__c];

        for(AggregateResult ar: groupedResults){
            lastMonth = (decimal)ar.get('lastmonth');
        }

        Integer intLastMonth = Integer.valueof(lastMonth);
        Decimal paperCost = .005;
        Decimal theSavings = intLastMonth * paperCost;
        System.debug('lastmonth ('+intLastMonth+') * '+paperCost+' = $'+theSavings);
        System.debug('$'+theSavings);

        return theSavings;
    }
}
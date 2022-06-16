public with sharing class fetchOpenServiceRequests {

    @AuraEnabled(Cacheable=true)

    public static integer fetchOpenUniFLOW(){

        String acctId;
        String userId = UserInfo.getUserId();
        RecordType rt = [SELECT id from RecordType WHERE DeveloperName = 'uniFLOW' LIMIT 1];

        User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

        If (string.isBlank(activeUser.Contact_Account_Id__c )) {
            acctId = activeUser.Test_Acct_Id__c  ;
        } else {
            acctId = activeUser.Contact_Account_Id__c;
        }

        LIST <Case> ufCases = [SELECT id FROM Case WHERE AccountId = :acctId AND RecordTypeId = :rt.id AND Status NOT IN ('Closed', 'Resolved')];

        integer uFCount = ufCases.size();

        return uFCount;

    }

    @AuraEnabled(Cacheable=true)

    public static integer fetchOpenDeviceSuppot(){

        String acctId;
        String userId = UserInfo.getUserId();
        RecordType rt = [SELECT id from RecordType WHERE DeveloperName = 'Device_Support' LIMIT 1];

        User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

        If (string.isBlank(activeUser.Contact_Account_Id__c )) {
            acctId = activeUser.Test_Acct_Id__c  ;
        } else {
            acctId = activeUser.Contact_Account_Id__c;
        }

        LIST <Case> dsCases = [SELECT id FROM Case WHERE AccountId = :acctId AND RecordTypeId = :rt.id AND Status NOT IN ('Closed', 'Resolved')];

        integer dsCount = dsCases.size();

        return dsCount;

    }

    @AuraEnabled(Cacheable=true)

    public static integer fetchOpenAll(){

        String acctId;
        String userId = UserInfo.getUserId();
        RecordType rt1 = [SELECT id from RecordType WHERE DeveloperName = 'Device_Support' LIMIT 1];
        RecordType rt2 = [SELECT id from RecordType WHERE DeveloperName = 'uniFLOW' LIMIT 1];

        User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

        If (string.isBlank(activeUser.Contact_Account_Id__c )) {
            acctId = activeUser.Test_Acct_Id__c  ;
        } else {
            acctId = activeUser.Contact_Account_Id__c;
        }

        LIST <Case> allCases = [SELECT id FROM Case WHERE AccountId = :acctId AND RecordTypeId IN (:rt2.id, :rt1.id) AND Status NOT IN ('Closed', 'Resolved')];

        integer allCount = allCases.size();

        return allCount;

    }
}

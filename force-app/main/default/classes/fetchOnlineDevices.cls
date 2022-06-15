public with sharing class fetchOnlineDevices {

    @AuraEnabled(Cacheable=true)

    public static integer fetchDevices(){
            String acctId;
            String userId = UserInfo.getUserId();

            User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

            If (string.isBlank(activeUser.Contact_Account_Id__c )) {
                acctId = activeUser.Test_Acct_Id__c  ;
            } else {
                acctId = activeUser.Contact_Account_Id__c;
            }

            LIST <Assets2__c> theDevices = [SELECT Id, Name FROM Assets2__c WHERE Account__c = :acctId];

            integer theCount = theDevices.size();

            return theCount;   
    }
}

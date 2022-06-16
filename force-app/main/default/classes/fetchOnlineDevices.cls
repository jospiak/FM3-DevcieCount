public with sharing class fetchOnlineDevices {

    @AuraEnabled(Cacheable=true)

    public static integer fetchOnline(){
            String acctId;
            String userId = UserInfo.getUserId();

            User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

            If (string.isBlank(activeUser.Contact_Account_Id__c )) {
                acctId = activeUser.Test_Acct_Id__c  ;
            } else {
                acctId = activeUser.Contact_Account_Id__c;
            }

            LIST <Assets2__c> theDevices = [SELECT Id, Name, Online__c, Offline__c, Retired__c FROM Assets2__c WHERE Account__c = :acctId];
            LIST <Assets2__c> onlineDevices = new List<Assets2__c>();
            LIST <Assets2__c> offlineDevices = new List<Assets2__c>();
            LIST <Assets2__c> retiredDevices = new List<Assets2__c>();

            for(Assets2__c td : theDevices){
                if(td.Online__c == true){
                    onlineDevices.add(td);
                }else if(td.offline__c == true){
                    offlineDevices.add(td);
                }else if(td.retired__c == true){
                    retiredDevices.add(td);
                }
            }

            integer online = onlineDevices.size();

            return online;   
    }

    @AuraEnabled(Cacheable=true)

    public static integer fetchOffline(){
        String acctId;
            String userId = UserInfo.getUserId();

            User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

            If (string.isBlank(activeUser.Contact_Account_Id__c )) {
                acctId = activeUser.Test_Acct_Id__c  ;
            } else {
                acctId = activeUser.Contact_Account_Id__c;
            }

            LIST <Assets2__c> theDevices = [SELECT Id, Name, online__c, offline__c, retired__c FROM Assets2__c WHERE Account__c = :acctId];
            LIST <Assets2__c> onlineDevices = new List<Assets2__c>();
            LIST <Assets2__c> offlineDevices = new List<Assets2__c>();
            LIST <Assets2__c> retiredDevices = new List<Assets2__c>();

            for(Assets2__c td : theDevices){
                if(td.online__c == true){
                    onlineDevices.add(td);
                }else if(td.offline__c == true){
                    offlineDevices.add(td);
                }else if(td.retired__c == true){
                    retiredDevices.add(td);
                }
            }

            integer offline = offlineDevices.size();

            return offline;  

    }

    @AuraEnabled(Cacheable=true)

    public static integer fetchRetired(){
        String acctId;
            String userId = UserInfo.getUserId();

            User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

            If (string.isBlank(activeUser.Contact_Account_Id__c )) {
                acctId = activeUser.Test_Acct_Id__c  ;
            } else {
                acctId = activeUser.Contact_Account_Id__c;
            }

            LIST <Assets2__c> theDevices = [SELECT Id, Name, online__c, offline__c, retired__c FROM Assets2__c WHERE Account__c = :acctId];
            LIST <Assets2__c> onlineDevices = new List<Assets2__c>();
            LIST <Assets2__c> offlineDevices = new List<Assets2__c>();
            LIST <Assets2__c> retiredDevices = new List<Assets2__c>();

            for(Assets2__c td : theDevices){
                if(td.online__c == true){
                    onlineDevices.add(td);
                }else if(td.offline__c == true){
                    offlineDevices.add(td);
                }else if(td.retired__c == true){
                    retiredDevices.add(td);
                }
            }

            integer retired = retiredDevices.size();

            return retired;  

    }
}
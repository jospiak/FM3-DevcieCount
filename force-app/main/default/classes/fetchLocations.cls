 public with sharing class fetchLocations {

        @AuraEnabled(Cacheable=true)
    
        public static integer fetchAmer(){

            String acctId;
            String userId = UserInfo.getUserId();

            User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

            If (string.isBlank(activeUser.Contact_Account_Id__c )) {
                acctId = activeUser.Test_Acct_Id__c  ;
            } else {
                acctId = activeUser.Contact_Account_Id__c;
            }

            LIST <Location__c> theLocations = [SELECT Id, Name, Region__c FROM Location__c WHERE Account__c = :acctId];
            LIST <Location__c> amerLocations = new List<Location__c>();
            LIST <Location__c> emeaLocations = new List<Location__c>();
            LIST <Location__c> apacLocations = new List<Location__c>();

            for(Location__c l : theLocations){
                if(l.region__c == 'AMER'){
                    amerLocations.add(l);
                }else if(l.region__c == 'EMEA'){
                    emeaLocations.add(l);
                }else if(l.region__c == 'APAC'){
                    apacLocations.add(l);
                }
            }

            integer amer = amerLocations.size();

            return amer;

        }

        @AuraEnabled(Cacheable=true)
    
        public static integer fetchEmea(){

            String acctId;
            String userId = UserInfo.getUserId();

            User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

            If (string.isBlank(activeUser.Contact_Account_Id__c )) {
                acctId = activeUser.Test_Acct_Id__c  ;
            } else {
                acctId = activeUser.Contact_Account_Id__c;
            }

            LIST <Location__c> theLocations = [SELECT Id, Name, Region__c FROM Location__c WHERE Account__c = :acctId];
            LIST <Location__c> amerLocations = new List<Location__c>();
            LIST <Location__c> emeaLocations = new List<Location__c>();
            LIST <Location__c> apacLocations = new List<Location__c>();

            for(Location__c l : theLocations){
                if(l.region__c == 'AMER'){
                    amerLocations.add(l);
                }else if(l.region__c == 'EMEA'){
                    emeaLocations.add(l);
                }else if(l.region__c == 'APAC'){
                    apacLocations.add(l);
                }
            }

            integer emea = emeaLocations.size();

            return emea;

        }

        @AuraEnabled(Cacheable=true)
    
        public static integer fetchApac(){

            String acctId;
            String userId = UserInfo.getUserId();

            User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

            If (string.isBlank(activeUser.Contact_Account_Id__c )) {
                acctId = activeUser.Test_Acct_Id__c  ;
            } else {
                acctId = activeUser.Contact_Account_Id__c;
            }

            LIST <Location__c> theLocations = [SELECT Id, Name, Region__c FROM Location__c WHERE Account__c = :acctId];
            LIST <Location__c> amerLocations = new List<Location__c>();
            LIST <Location__c> emeaLocations = new List<Location__c>();
            LIST <Location__c> apacLocations = new List<Location__c>();

            for(Location__c l : theLocations){
                if(l.region__c == 'AMER'){
                    amerLocations.add(l);
                }else if(l.region__c == 'EMEA'){
                    emeaLocations.add(l);
                }else if(l.region__c == 'APAC'){
                    apacLocations.add(l);
                }
            }

            integer apac = apacLocations.size();

            return apac;

        }

        @AuraEnabled(Cacheable=true)
    
        public static integer fetchAll(){

            String acctId;
            String userId = UserInfo.getUserId();

            User activeUser = [SELECT Contact_Account_Id__c, Test_Acct_Id__c FROM USER WHERE id = :userId LIMIT 1];

            If (string.isBlank(activeUser.Contact_Account_Id__c )) {
                acctId = activeUser.Test_Acct_Id__c  ;
            } else {
                acctId = activeUser.Contact_Account_Id__c;
            }

            LIST <Location__c> theLocations = [SELECT Id, Name, Region__c FROM Location__c WHERE Account__c = :acctId];
            
            integer all = theLocations.size();

            return all;

        }
}

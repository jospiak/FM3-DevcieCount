@isTest
public class testFetchOnlineDevices {
    
@isTest(SeeAllData=true)
    public static void testFetchOnline(){
        Id profile = [SELECT id FROM Profile where Name = 'Fleet Manager Power User'].id;
        Id profile2 = [SELECT id FROM Profile where Name = 'System Administrator'].id;
        datetime now = datetime.now();
        
        account testAccount = new Account(Name = 'Testco', Grant_F_A_Access__c = true);
        insert testAccount;
        
        contact testContact = new contact(FirstName = 'Lucas',
                                          LastName = 'Digne',
                                          email = 'ldigne@testco.com',
                                          accountid = testAccount.id);
        insert testContact;
        
        contact testContact2 = new contact(FirstName = 'Lucas',
                                          LastName = 'Digne',
                                          email = 'ldigne@testco.com');
        insert testContact2;
        
        User testUser = new User(alias = 'test123', email='test123@noemail.com',
                                 emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
                                 localesidkey='en_US', profileid = profile, country='United States',IsActive =true,
                                 ContactId = testContact.Id,
                                 timezonesidkey='America/Los_Angeles', username='testcu@test.com');
        
         User testClassUser = new User(alias = 'test1234', email='test1234@noemail.com',
                                 emailencodingkey='UTF-8', lastname='Testing2', languagelocalekey='en_US',
                                 localesidkey='en_US', profileid = profile2, country='United States',IsActive =true, Test_Acct_Id__c = testAccount.id,
                                 timezonesidkey='America/Los_Angeles', username='testclass@test.com');
        
        Service_Provider__c testSP = new Service_Provider__c(Name = 'Test SP',
                                                             Support_Email_Address__c = 'test@test.com',
                                                             Support_Phone_Number__c = '3155551212',
                                                             Street_Address__c = '111 Any Street',
                                                             City__c = 'Any Town',
                                                             Country__c = 'United States',
                                                             State_Province__c = 'New York');
        Insert testSP;
        
        Location__c testLoc = new Location__c(Name = 'Test Location',
                                              Service_Provider__c = testSP.Id,
                                              Account__c = testAccount.id,
                                              Location_Type__c = 'Domestic (US)');
        Insert testLoc;
        
        
        
        Assets2__c testAst = new Assets2__c (Name = 'ZZZ12345ZZZ',
                                             Account__c = testAccount.Id,
                                             Location__c = testLoc.Id,
                                             Service_Provider__c = testSP.Id,
                                             Last_Successful_Communication__c = now,
                                             Manufacturer__c = 'Canon',
                                             Model__c = 'iR-ADV 400');
        Insert testAst;
        
        Assets2__c testAst2 = new Assets2__c (Name = 'ZZZ12346ZZZ',
                                             Account__c = testAccount.Id,
                                             Location__c = testLoc.Id,
                                             Service_Provider__c = testSP.Id,
                                             Last_Successful_Communication__c = now.addDays(-10),
                                             Manufacturer__c = 'Canon',
                                             Model__c = 'iR-ADV 400');
        Insert testAst2;
        
         Assets2__c testAst3 = new Assets2__c (Name = 'ZZZ12347ZZZ',
                                             Account__c = testAccount.Id,
                                             Location__c = testLoc.Id,
                                             Service_Provider__c = testSP.Id,
                                             Last_Successful_Communication__c = now.addDays(-35),
                                             Manufacturer__c = 'Canon',
                                             Model__c = 'iR-ADV 400');
        Insert testAst3;       
        
        
        system.runAs(testUser){
            String userId = UserInfo.getUserId();
            
            List<Assets2__c> theAssets = [SELECT Id, Name, Online__c, Offline__c, Retired__c from Assets2__c WHERE Account__c = :testAccount.id and Online__c = true];
            
            integer testMetric = theAssets.size();
          	
            integer metric = fetchOnlineDevices.fetchOnline();
            system.assert(metric == testMetric);
        }
        
        system.runAs(testClassUser){
            String userId = UserInfo.getUserId();
            
            List<Assets2__c> theAssets = [SELECT Id, Name, Online__c, Offline__c, Retired__c from Assets2__c WHERE Account__c = :testAccount.id and Online__c = true];
            
            integer testMetric = theAssets.size();
          	
            integer metric = fetchOnlineDevices.fetchOnline();
            system.assert(metric == testMetric);
        }
    
    }
@isTest(SeeAllData=true)
    public static void testFetchOffline(){
        Id profile = [SELECT id FROM Profile where Name = 'Fleet Manager Power User'].id;
        Id profile2 = [SELECT id FROM Profile where Name = 'System Administrator'].id;
        datetime now = datetime.now();
        
        account testAccount = new Account(Name = 'Testco', Grant_F_A_Access__c = true);
        insert testAccount;
        
        contact testContact = new contact(FirstName = 'Lucas',
                                          LastName = 'Digne',
                                          email = 'ldigne@testco.com',
                                          accountid = testAccount.id);
        insert testContact;
        
        contact testContact2 = new contact(FirstName = 'Lucas',
                                          LastName = 'Digne',
                                          email = 'ldigne@testco.com');
        insert testContact2;
        
        User testUser = new User(alias = 'test123', email='test123@noemail.com',
                                 emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
                                 localesidkey='en_US', profileid = profile, country='United States',IsActive =true,
                                 ContactId = testContact.Id,
                                 timezonesidkey='America/Los_Angeles', username='testcu@test.com');
        
         User testClassUser = new User(alias = 'test1234', email='test1234@noemail.com',
                                 emailencodingkey='UTF-8', lastname='Testing2', languagelocalekey='en_US',
                                 localesidkey='en_US', profileid = profile2, country='United States',IsActive =true, Test_Acct_Id__c = testAccount.id,
                                 timezonesidkey='America/Los_Angeles', username='testclass@test.com');
        
        Service_Provider__c testSP = new Service_Provider__c(Name = 'Test SP',
                                                             Support_Email_Address__c = 'test@test.com',
                                                             Support_Phone_Number__c = '3155551212',
                                                             Street_Address__c = '111 Any Street',
                                                             City__c = 'Any Town',
                                                             Country__c = 'United States',
                                                             State_Province__c = 'New York');
        Insert testSP;
        
        Location__c testLoc = new Location__c(Name = 'Test Location',
                                              Service_Provider__c = testSP.Id,
                                              Account__c = testAccount.id,
                                              Location_Type__c = 'Domestic (US)');
        Insert testLoc;
        
        
        
        Assets2__c testAst = new Assets2__c (Name = 'ZZZ12345ZZZ',
                                             Account__c = testAccount.Id,
                                             Location__c = testLoc.Id,
                                             Service_Provider__c = testSP.Id,
                                             Last_Successful_Communication__c = now,
                                             Manufacturer__c = 'Canon',
                                             Model__c = 'iR-ADV 400');
        Insert testAst;
        
        Assets2__c testAst2 = new Assets2__c (Name = 'ZZZ12346ZZZ',
                                             Account__c = testAccount.Id,
                                             Location__c = testLoc.Id,
                                             Service_Provider__c = testSP.Id,
                                             Last_Successful_Communication__c = now.addDays(-10),
                                             Manufacturer__c = 'Canon',
                                             Model__c = 'iR-ADV 400');
        Insert testAst2;
        
         Assets2__c testAst3 = new Assets2__c (Name = 'ZZZ12347ZZZ',
                                             Account__c = testAccount.Id,
                                             Location__c = testLoc.Id,
                                             Service_Provider__c = testSP.Id,
                                             Last_Successful_Communication__c = now.addDays(-35),
                                             Manufacturer__c = 'Canon',
                                             Model__c = 'iR-ADV 400');
        Insert testAst3;       
        
        
        system.runAs(testUser){
            String userId = UserInfo.getUserId();
            
            List<Assets2__c> theAssets = [SELECT Id, Name, Online__c, Offline__c, Retired__c from Assets2__c WHERE Account__c = :testAccount.id and Online__c = true];
            
            integer testMetric = theAssets.size();
          	
            integer metric = fetchOnlineDevices.fetchOffline();
            system.assert(metric == testMetric);
        }
        
        system.runAs(testClassUser){
            String userId = UserInfo.getUserId();
            
            List<Assets2__c> theAssets = [SELECT Id, Name, Online__c, Offline__c, Retired__c from Assets2__c WHERE Account__c = :testAccount.id and Online__c = true];
            
            integer testMetric = theAssets.size();
          	
            integer metric = fetchOnlineDevices.fetchOffline();
            system.assert(metric == testMetric);
        }
    
    }
 
    @isTest(SeeAllData=true)
    public static void testFetchRetired(){
        Id profile = [SELECT id FROM Profile where Name = 'Fleet Manager Power User'].id;
        Id profile2 = [SELECT id FROM Profile where Name = 'System Administrator'].id;
        datetime now = datetime.now();
        
        account testAccount = new Account(Name = 'Testco', Grant_F_A_Access__c = true);
        insert testAccount;
        
        contact testContact = new contact(FirstName = 'Lucas',
                                          LastName = 'Digne',
                                          email = 'ldigne@testco.com',
                                          accountid = testAccount.id);
        insert testContact;
        
        contact testContact2 = new contact(FirstName = 'Lucas',
                                          LastName = 'Digne',
                                          email = 'ldigne@testco.com');
        insert testContact2;
        
        User testUser = new User(alias = 'test123', email='test123@noemail.com',
                                 emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
                                 localesidkey='en_US', profileid = profile, country='United States',IsActive =true,
                                 ContactId = testContact.Id,
                                 timezonesidkey='America/Los_Angeles', username='testcu@test.com');
        
         User testClassUser = new User(alias = 'test1234', email='test1234@noemail.com',
                                 emailencodingkey='UTF-8', lastname='Testing2', languagelocalekey='en_US',
                                 localesidkey='en_US', profileid = profile2, country='United States',IsActive =true, Test_Acct_Id__c = testAccount.id,
                                 timezonesidkey='America/Los_Angeles', username='testclass@test.com');
        
        Service_Provider__c testSP = new Service_Provider__c(Name = 'Test SP',
                                                             Support_Email_Address__c = 'test@test.com',
                                                             Support_Phone_Number__c = '3155551212',
                                                             Street_Address__c = '111 Any Street',
                                                             City__c = 'Any Town',
                                                             Country__c = 'United States',
                                                             State_Province__c = 'New York');
        Insert testSP;
        
        Location__c testLoc = new Location__c(Name = 'Test Location',
                                              Service_Provider__c = testSP.Id,
                                              Account__c = testAccount.id,
                                              Location_Type__c = 'Domestic (US)');
        Insert testLoc;
        
        
        
        Assets2__c testAst = new Assets2__c (Name = 'ZZZ12345ZZZ',
                                             Account__c = testAccount.Id,
                                             Location__c = testLoc.Id,
                                             Service_Provider__c = testSP.Id,
                                             Last_Successful_Communication__c = now,
                                             Manufacturer__c = 'Canon',
                                             Model__c = 'iR-ADV 400');
        Insert testAst;
        
        Assets2__c testAst2 = new Assets2__c (Name = 'ZZZ12346ZZZ',
                                             Account__c = testAccount.Id,
                                             Location__c = testLoc.Id,
                                             Service_Provider__c = testSP.Id,
                                             Last_Successful_Communication__c = now.addDays(-10),
                                             Manufacturer__c = 'Canon',
                                             Model__c = 'iR-ADV 400');
        Insert testAst2;
        
         Assets2__c testAst3 = new Assets2__c (Name = 'ZZZ12347ZZZ',
                                             Account__c = testAccount.Id,
                                             Location__c = testLoc.Id,
                                             Service_Provider__c = testSP.Id,
                                             Last_Successful_Communication__c = now.addDays(-35),
                                             Manufacturer__c = 'Canon',
                                             Model__c = 'iR-ADV 400');
        Insert testAst3;       
        
        
        system.runAs(testUser){
            String userId = UserInfo.getUserId();
            
            List<Assets2__c> theAssets = [SELECT Id, Name, Online__c, Offline__c, Retired__c from Assets2__c WHERE Account__c = :testAccount.id and Online__c = true];
            
            integer testMetric = theAssets.size();
          	
            integer metric = fetchOnlineDevices.fetchRetired();
            system.assert(metric == testMetric);
        }
        
        system.runAs(testClassUser){
            String userId = UserInfo.getUserId();
            
            List<Assets2__c> theAssets = [SELECT Id, Name, Online__c, Offline__c, Retired__c from Assets2__c WHERE Account__c = :testAccount.id and Online__c = true];
            
            integer testMetric = theAssets.size();
          	
            integer metric = fetchOnlineDevices.fetchRetired();
            system.assert(metric == testMetric);
        }
    
    }
    
}
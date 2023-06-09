@isTest
public class TestDataBaseUtility {
    
    public static SBQQ__QuoteLine__c createQLAndAssociatedRecords(Map<String, String> mapWithConfiguratorValues){
        
        Pricebook2 standardPricebook = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            IsActive = true
        );
        
        //Execute an update DML on the Pricebook2 record, to make IsStandard to true
        Update standardPricebook;
        
        //Account
        Account acc1 = new Account();
        acc1.Name = 'test2';
        acc1.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partner & House Account').getRecordTypeId();
        acc1.Rep_Code__c = 'UCN1';
        acc1.Region__c = 'DUPS';
        acc1.District__c = 'AMERICAS';
        acc1.Payment_Terms__c = 'BM';
        acc1.External_ID__c = 'UCN1-DUPS1-AMERICAS';
        insert acc1;
        
        Account acc = new Account();
        acc.Name = 'test1';
        acc.Payment_Terms__c = 'BM';
        acc.Rep_Code_Account__c = acc1.Id;
        acc.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Customer Account').getRecordTypeId();
        // Service Ticket #205643
        acc.BillingCity = 'Mumbai';
       	acc.BillingStreet = 'ABC Street';
        acc.BillingCountry = 'India';  
        insert acc;
        
        acc1.IsPartner = true;
        update acc1;
        
        //Contact
        Contact con = new Contact();
        con.LastName = 'test_Contact';
        con.AccountId = acc1.Id;
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity1';
        opp.AccountId = acc.Id;
        opp.PartnerAccountId = acc1.Id;
        
        opp.ContactId = con.Id;
        opp.EPC_Firm_Involved__c = 'No';
        opp.Type = 'Existing Business';
        opp.End_Use_Application__c = 'Facebook';
        opp.End_User__c = acc.Id;
        opp.Shipping_Account__c = acc.Id;
        opp.Is_it_a_Project__c = 'Yes';
        opp.Brand__c = mapWithConfiguratorValues.get('BRAND');
        opp.CloseDate = system.today().adddays(15);
        opp.StageName = 'Discovery/Identified';
        opp.Sourcing_Entity__c = '10';
        opp.Sales_Division__c = '10';
        opp.Customer_Currency__c = 'INR';
        opp.OEM__c = 'No';
        insert opp ;
        
        //Quotes
        SBQQ__Quote__c quote = new SBQQ__Quote__c();
        quote.SBQQ__Account__c = acc.Id;
        quote.SBQQ__Opportunity2__c = opp.Id;
        quote.SBQQ__SubscriptionTerm__c = 12;
        quote.Configuration_Availability__c = 'A';
        insert quote; 
        
        //Product2
        Product2 prod = new Product2();
        prod.Name = mapWithConfiguratorValues.get('PRODUCT_NAME');
        prod.Family = mapWithConfiguratorValues.get('BRAND');
        prod.ProductCode = mapWithConfiguratorValues.get('PRODUCT_CODE');
        insert prod;
        
        //QuoteLine
        SBQQ__QuoteLine__c quoteLine = new SBQQ__QuoteLine__c();
        quoteLine.SBQQ__Product__c = prod.Id;
        quoteLine.SBQQ__Quote__c = quote.Id;
        quoteLine.Non_Discountable_List_Price__c = 99999;
        insert quoteLine;
        
        return quoteLine;
    }

    public static SBQQ__QuoteLine__c createQLAndAssociatedRecordsBooster3(Map<String, String> mapWithConfiguratorValues){
        //Account
        Account acc3 = new Account();
        acc3.Name = 'AlaskaPartner';
        acc3.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partner & House Account').getRecordTypeId();
        acc3.Rep_Code__c = 'AK2';
        acc3.Region__c = 'AF1';
        acc3.District__c = 'AMERICAS';
        acc3.Payment_Terms__c = 'BS';
        acc3.External_ID__c = 'AK2-AF1-AMERICAS-BS-TEST';
        insert acc3;
        
        Account acc4 = new Account();
        acc4.Name = 'AnchorageCustomer';
        acc4.Payment_Terms__c = 'BS';
        acc4.Rep_Code_Account__c = acc3.Id;
        acc4.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Customer Account').getRecordTypeId();
        acc4.BillingCity = 'Anchorage';
        acc4.BillingStreet = '123 Caribou Ave';
        acc4.BillingCountry = 'United States';  
        insert acc4;
        
        acc3.IsPartner = true;
        update acc3;
        
        //Contact
        Contact con = new Contact();
        con.LastName = 'test_Contact333';
        con.AccountId = acc3.Id;
        insert con;

        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity333';
        opp.AccountId = acc4.Id;
        opp.PartnerAccountId = acc3.Id;
        
        opp.ContactId = con.Id;
        opp.EPC_Firm_Involved__c = 'No';
        opp.Type = 'Existing Business';
        opp.End_Use_Application__c = 'Facebook';
        opp.End_User__c = acc4.Id;
        opp.Shipping_Account__c = acc4.Id;
        opp.Is_it_a_Project__c = 'Yes';
        opp.Brand__c = mapWithConfiguratorValues.get('BRAND');
        opp.CloseDate = system.today().adddays(15);
        opp.StageName = 'Discovery/Identified';
        opp.Sourcing_Entity__c = '10';
        opp.Sales_Division__c = '10';
        opp.Customer_Currency__c = 'INR';
        opp.OEM__c = 'No';
        insert opp ;

        //Quotes
        SBQQ__Quote__c quote = new SBQQ__Quote__c();
        quote.SBQQ__Account__c = acc4.Id;
        quote.SBQQ__Opportunity2__c = opp.Id;
        quote.SBQQ__SubscriptionTerm__c = 12;
        quote.Configuration_Availability__c = 'A';
        insert quote; 
        
        //Product2
        Product2 prod = new Product2();
        prod.Name = mapWithConfiguratorValues.get('PRODUCT_NAME');
        prod.Family = mapWithConfiguratorValues.get('BRAND');
        prod.ProductCode = mapWithConfiguratorValues.get('PRODUCT_CODE');
        insert prod;
        
        //QuoteLine
        SBQQ__QuoteLine__c quoteLine = new SBQQ__QuoteLine__c();
        quoteLine.SBQQ__Product__c = prod.Id;
        quoteLine.SBQQ__Quote__c = quote.Id;
        quoteLine.Non_Discountable_List_Price__c = 99999;
        insert quoteLine;
        
        return quoteLine;

    }


    public static SBQQ__Quote__c createQuoteAndAssociatedRecords(Map<String, String> mapWithConfiguratorValues){
        Pricebook2 standardPricebook = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            IsActive = true
        );
        
        //Execute an update DML on the Pricebook2 record, to make IsStandard to true
        Update standardPricebook;
        
        //Account
        Account acc10 = new Account();
        acc10.Name = 'test10';
        acc10.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partner & House Account').getRecordTypeId();
        acc10.Rep_Code__c = 'UCN1';
        acc10.Region__c = 'DUPS';
        acc10.District__c = 'AMERICAS';
        acc10.Payment_Terms__c = 'BM';
        acc10.External_ID__c = 'UCN1-DUPS-AMERICAS';
        insert acc10;
        
        Account acc12 = new Account();
        acc12.Name = 'test11';
        acc12.Payment_Terms__c = 'BM';
        acc12.Rep_Code_Account__c = acc10.Id;
        acc12.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Customer Account').getRecordTypeId();
        // Service Ticket #205643
        acc12.BillingCity = 'Mumbai';
       	acc12.BillingStreet = 'ABC Street';
        acc12.BillingCountry = 'India';
        insert acc12;
        acc10.IsPartner = true;
        update acc10;
        
        //Contact
        Contact con10 = new Contact();
        con10.LastName = 'test_Contact';
        con10.AccountId = acc10.Id;
        insert con10;
        
        Opportunity opp10 = new Opportunity();
        opp10.Name = 'Test Opportunity1';
        opp10.AccountId = acc12.Id;
        opp10.PartnerAccountId = acc10.Id;
        
        opp10.ContactId = con10.Id;
        opp10.EPC_Firm_Involved__c = 'No';
        opp10.Type = 'Existing Business';
        opp10.End_Use_Application__c = 'Facebook';
        opp10.End_User__c = acc12.Id;
        opp10.Shipping_Account__c = acc12.Id;
        opp10.Is_it_a_Project__c = 'Yes';
        opp10.Brand__c = mapWithConfiguratorValues.get('BRAND');
        opp10.CloseDate = system.today().adddays(15);
        opp10.StageName = 'Discovery/Identified';
        opp10.Sourcing_Entity__c = '10';
        opp10.Sales_Division__c = '10';
        opp10.Customer_Currency__c = 'INR';
        opp10.OEM__c = 'No';
        insert opp10;
        
        //Quotes
        SBQQ__Quote__c quote = new SBQQ__Quote__c();
        quote.SBQQ__Account__c = acc12.Id;
        quote.SBQQ__Opportunity2__c = opp10.Id;
        quote.SBQQ__SubscriptionTerm__c = 12;
        quote.Configuration_Availability__c = 'A';
        insert quote;
        
        return quote;
    }
}
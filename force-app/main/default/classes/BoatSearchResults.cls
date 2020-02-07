public with sharing class BoatSearchResults {
    @AuraEnabled
    public static List<BoatType__c> getBoatTypes() {
        return [SELECT Id, Name FROM BoatType__c];
    }

    @AuraEnabled
    public static List<Boat__c> getBoats(String boatTypeId) {
        List<Boat__c> boatlist=new List<Boat__c>();
        if (boatTypeId != null && boatTypeId.length() > 0) {
            boatlist= [SELECT Id, Name, Description__c, Price__c, Length__c, Contact__r.Name, Contact__r.Email, Contact__r.HomePhone, BoatType__r.Name, Picture__c, Geolocation__c FROM Boat__c WHERE BoatType__c = :boatTypeId];
        System.debug(boatTypeId+'**boatlist____1: '+boatlist);
            return boatlist;
        }

        boatlist= [SELECT Id, Name, Description__c, Price__c, Length__c, Contact__r.Name, Contact__r.Email, Contact__r.HomePhone, BoatType__r.Name, Picture__c, Geolocation__c FROM Boat__c];
        System.debug('**boatlist____2: '+boatlist);
        return boatlist;
    }
}
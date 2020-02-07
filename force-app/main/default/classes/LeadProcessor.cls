global class LeadProcessor implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('Select id,LeadSource from lead where LeadSource!=\'Dreamforce\'');
    }
    global void execute(Database.BatchableContext bc, List<lead> scope){
        for(Lead ld:scope){
            ld.leadSource='Dreamforce';
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc){
        System.debug('Finished');
    }
    
}
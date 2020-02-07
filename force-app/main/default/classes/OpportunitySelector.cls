public class OpportunitySelector {
    public static String STAGE_RESUBMIT_PROJECT='Resubmit';
    public static String STAGE_SUBMITTED_PROJECT='Submitted';
    public static String STAGE_CLOSED_WON='Closed Won';
    public static List<Opportunity> getOpportunities(Set<id> oppids){
        return [Select id,name,closedate,Account.name,Amount,stagename from opportunity where id=:oppids];
    }
    
    public static List<Opportunity> getAllOpportunities(Integer queryLimit) {
        return [
                SELECT
                        Id, Stagename,Accountid,account.name,amount, Name,DeliveryInstallationStatus__c
                FROM
                        Opportunity
                LIMIT
                        :queryLimit
        ];
    }
    
  /*  public static Map<Integer,Opportunity> getAllOpportunities(integer i){
        Map<Integer,Opportunity> newopp=new Map<Integer,Opportunity>();
        Account ac=new account();
        ac.name='tets';
        insert ac;
        for(integer j=0;j<i;j++){
            
            Opportunity opp=new opportunity();
            opp.accountid=ac.id;
            opp.Description='test'+j;
            opp.Name='Opp'+j;
            newopp.put(j,opp);    
        }
        if(!newopp.isEmpty()){
            insert newopp.values();
        }
        return newopp;
    }*/
}
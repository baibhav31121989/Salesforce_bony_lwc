@istest
public class DailyLeadProcessorTest {
     public static String CRON_EXP = '0 0 0 15 3 ? 2022';
 @testSetup 
    static void setup() {
        List<Lead> ldlist=new List<lead>();
        for(Integer i=1;i<=200;i++){
            lead ld=new lead();
            ld.FirstName='test';
            ld.LastName='last'+i;
            ld.Company='comp'+i;
            ldlist.add(ld);
        }
        insert ldlist;
    }
    static testmethod void test() { 
    String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor()); 
    }
}
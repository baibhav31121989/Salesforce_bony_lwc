@istest
public class LeadProcessorTest {
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
    LeadProcessor batch=new LeadProcessor();
      Database.executeBatch(batch);  
    }
}
@istest
public class AnimalLocatorTest {
    
   testmethod static void  Restcallout(){
        
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        string s=AnimalLocator.getAnimalNameById(1);
        
    }

}
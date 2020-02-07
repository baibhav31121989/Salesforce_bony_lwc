/**
 * @File Name          : AccountManager.cls
 * @Description        : 
 * @Author             : Baibhav Kumar
 * @Group              : 
 * @Last Modified By   : Baibhav Kumar
 * @Last Modified On   : 2/7/2020, 1:11:40 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/7/2020   Baibhav Kumar     Initial Version
**/
@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest req = RestContext.request;
        String accId = req.requestURI.substringBetween('Accounts/', '/contacts');
        Account acc = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) 
                       FROM Account WHERE Id = :accId];
		return acc;
        //added comment
        // commit from vs code test
	    
    }
}

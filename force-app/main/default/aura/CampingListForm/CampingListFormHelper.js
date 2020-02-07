({
               helperMethod : function() {
                             
               },
   
   
    validateCampingListForm: function(component) {
       
 
        var validItem = true;
   
        // Name must not be blank (aura id)
        var nameField = component.find("campItemName");
       
        if ($A.util.isEmpty(newItem.Name)){
            validItem = false;
           component.set("v.errors",  component.get("v.errors").push("Item Name an item quantity."));
        }
        else {
            component.set("v.errors", []);
        }
   
        // Quantity must be set, must be a positive number
       
      
        if ($A.util.isEmpty(newItem.Qunatity__c) || isNaN(newItem.Qunatity__c) || (newItem.Qunatity__c <= 0.0)){
            validItem = false;
            component.set("v.errors",   component.get("v.errors").push("Enter an item quantity."));
        }
        else {
            // If the quantity looks good, unset any errors...
            component.set("v.errors", []);
        }
       
        //also do price
     
      
        if ($A.util.isEmpty(newItem.Price__c) || isNaN(newItem.Price__c) || (newItem.Price__c <= 0.0)){
            validItem = false;
            component.set("v.errors",  component.get("v.errors").push("Enter an item Price."));
        }
        else {
            // If the price looks good, unset any errors...
            component.set("v.errors", null);
        }
        console.log('validItem='+validItem+'<<<');
        return(validItem);
       
    },//validateCampingListForm
   
    createItem: function(component, newItem) {
          
        console.log('in addItem');
        var newItem = component.get("v.newItem");
        var addEvent = component.getEvent("addItem");
        addEvent.setParams({"item" : newItem});
        addEvent.fire();
 
       
        //component.set("v.newItem", default);
        component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                'Name': '',
                'Quantity__c': 0,
                'Price__c': 0,
                'Packed__c': false});
    },//addItem
   
 
})
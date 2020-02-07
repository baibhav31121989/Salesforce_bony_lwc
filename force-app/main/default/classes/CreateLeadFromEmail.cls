/**
* Email services are automated processes that use Apex classes
* to process the contents, headers, and attachments of inbound
* email.
*/
global class CreateLeadFromEmail implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        String subToCompare = 'Create Lead';
         System.debug('Emailbidy:**'+email.plainTextBody);
        if(email.subject.equalsIgnoreCase(subToCompare)){
            Lead l = new Lead();
           
            l.LastName = email.plainTextBody;
            l.Company = 'Created from Mail';
           // insert l;
            System.debug('email==> '+email);
            if(email.textAttachments != null){                
                for (Messaging.Inboundemail.TextAttachment tAttachment : email.textAttachments) {
                    Attachment att = new Attachment();
                    att.Name = tAttachment.fileName;
                    att.Body = Blob.valueOf(tAttachment.body);
                    att.ParentId = l.Id;
                    insert att;
                }   
            }
            if(email.binaryAttachments != null){
                for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) {
                    Attachment att = new Attachment();       
                    att.Name = bAttachment.fileName;
                    att.Body = bAttachment.body;
                    att.ParentId = l.Id;
                    insert att;
                }
            }
        }
        result.success = true;
        return result;
    }
}
public class JSON2Apex {
    
    public Attributes attributes {get;set;}
    public Map<String,object> API_Json_Body {get;set;}
    public String CreatedById {get;set;}
    public Boolean Is_DNC_API_Present {get;set;}
    public String ReplayId {get;set;}
    public Boolean Has_Next_Request {get;set;}
    public String CreatedDate {get;set;}
    public String Id {get;set;}
    public String Transaction_Key {get;set;}
    
    public JSON2Apex(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    if (text == 'attributes') {
                        attributes = new Attributes(parser);
                    } else if (text == 'API_Json_Body__c') {
                        System.debug('test****'+parser.getText());
                        // API_Json_Body = parser.getText();
                        API_Json_Body=(Map<String,object>)JSON.deserializeUntyped(parser.getText());
                    } else if (text == 'CreatedById') {
                        CreatedById = parser.getText();
                    } else if (text == 'Is_DNC_API_Present__c') {
                        Is_DNC_API_Present = parser.getBooleanValue();
                    } else if (text == 'ReplayId') {
                        ReplayId = parser.getText();
                    } else if (text == 'Has_Next_Request__c') {
                        Has_Next_Request = parser.getBooleanValue();
                    } else if (text == 'CreatedDate') {
                        CreatedDate = parser.getText();
                    } else if (text == 'Id') {
                        Id = parser.getText();
                    } else if (text == 'Transaction_Key__c') {
                        Transaction_Key = parser.getText();
                    } else {
                        System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }
    
    public class Attributes {
        public String type_Z {get;set;} // in json: type
        public String url {get;set;}
        
        public Attributes(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'type') {
                            type_Z = parser.getText();
                        } else if (text == 'url') {
                            url = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Attributes consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public static List<JSON2Apex> parse(String json) {
        System.JSONParser parser = System.JSON.createParser(json);
        return arrayOfJSON2Apex(parser);
    }
    public static void consumeObject(System.JSONParser parser) {
        Integer depth = 0;
        do {
            System.JSONToken curr = parser.getCurrentToken();
            if (curr == System.JSONToken.START_OBJECT ||
                curr == System.JSONToken.START_ARRAY) {
                    depth++;
                } else if (curr == System.JSONToken.END_OBJECT ||
                           curr == System.JSONToken.END_ARRAY) {
                               depth--;
                           }
        } while (depth > 0 && parser.nextToken() != null);
    }
    private static List<JSON2Apex> arrayOfJSON2Apex(System.JSONParser p) {
        List<JSON2Apex> res = new List<JSON2Apex>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new JSON2Apex(p));
        }
        return res;
    }
    
}
/**
 * @description       : Iterating rows of file data.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 08-12-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * External link:
 * https://salesforce.stackexchange.com/questions/85048/catch-regex-too-complicated-when-splitting-a-string-in-salesforce
**/
public with sharing class Utility_RowIterator implements Iterator<String>, Iterable<String> {

   private String data;
   private Integer index = 0;
   private String rowDelimiter = '\n';
    
   public Utility_RowIterator(String fileData) {
      data = fileData; 
   }

   public Utility_RowIterator(String fileData, String rowDelimiter) {
      data = fileData; 
      this.rowDelimiter = rowDelimiter;
   }
    
   public Boolean hasNext() {
      return index < data.length() ? true : false;
   }

   public String next() {     
      Integer key = data.indexOf(rowDelimiter, index);       
      if (key == -1) {
        key = data.length();
      }

      String row = data.subString(index, key);
      index = key + 1;

      return row;
   }

   public Iterator<String> Iterator() {
      return this;   
   }
}
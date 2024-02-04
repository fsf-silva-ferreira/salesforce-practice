/**
 * @description       : Manages Product__c data.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-04-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ProductController {

    static Integer PAGE_SIZE = 4;

    @AuraEnabled
    public static PagedResult getProducts(Filters filters, Integer pageNumber) {
        String key, whereClause = '';
        Decimal maxPrice;
        String[] categories, materials, levels;
        List<String> criteria = new List<String>{};

        if(filters != null) {
            maxPrice = filters.maxPrice;
            materials = filters.materials;
            levels = filters.levels;

            if(!String.isEmpty(filters.searchKey)) {
                key = '%' + filters.searchKey + '%';
                criteria.add('Name LIKE :key');
            }

            if(filters.maxPrice >= 0) {
                maxPrice = filters.maxPrice;
                criteria.add('MRSP__c <= :maxPrice');
            }

            if(filters.categories != null) {
                categories = filters.categories;
                criteria.add('Category__c IN :categories');
            }

            if(filters.levels != null) {
                levels = filters.levels;
                criteria.add('Level__c in :levels');
            }

            if(filters.materials != null) {
                materials = filters.materials;
                criteria.add('Material__c IN :materials');
            }

            if(criteria.size() > 0) {
                whereClause = 'WHERE ' + String.join(criteria, ' AND ');
            }
        }

        Integer pageSize = ProductController.PAGE_SIZE;
        Integer offset = (pageNumber - 1) * pageSize;

        PagedResult result = new pageResult();
        result.pageSize = pageSize;
        result.pageNumber = pageNumber;
        result.totalItemCount = Database.countQuery('SELECT count() FROM Product__c ' + whereClause);
        result.records = Database.query(
            'SELECT Id, Name, MSRP__c, Description__c, Category__c, Level__c, Picture_URL__c, Material__c FROM Product__c ' +
            whereClause +
            ' ORDER BY Name LIMIT :pageSize OFFSET :offset' 
        );

        return result;
    }


    //Inner classes
    public class Filters {

        @AuraEnabled
        public String searchKey { get; set; }
        @AuraEnabled
        public Decimal maxPrice { get; set; }
        @AuraEnabled
        public String[] categories { get; set; }
        @AuraEnabled
        public String materials { get; set; }
        @AuraEnabled
        public String levels {get; set; }
    }    

    public class PagedResult {

        @AuraEnabled
        public Integer pageSize { get; set; }
        @AuraEnabled
        public Integer pageNumber { get; set; }
        @AuraEnabled
        public Integer totalItemCount { get; set; }
        public Object[] records { get; set; }
    }
}
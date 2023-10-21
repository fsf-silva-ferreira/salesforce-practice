@isTest
private class WarehouseCalloutServiceTest { 
    
    @isTest  
    static void testWareHouseCallout(){
        Test.startTest();
        Test.setMock(HTTPCalloutMock.class, new WarehouseCalloutServiceMock());
        WarehouseCalloutService.runWarehouseEquipmentSync();
        Test.stopTest();
        
        System.assertEquals(3, [SELECT count() FROM Product2]);
    }     
}
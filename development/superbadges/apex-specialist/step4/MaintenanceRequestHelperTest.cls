@isTest public with sharing class MaintenanceRequestHelperTest {     
    // implement scheduled code here     
    public static List <case >caseList1 = new List <case>();     
    public static List < product2 > prodList = new List < product2 > ();     
    public static List < Vehicle__c > vehicleList = new List < Vehicle__c > ();         
    public static List < Equipment_Maintenance_Item__c > equipMaintList = new List < Equipment_Maintenance_Item__c > ();     
    
    @testSetup     
    static void getData() {         
        caseList1 = CreateData(300, 300, 300, 'Repair');         
        system.assertEquals(caseList1.size(), 300);     
    }     
    
    public static List <case> CreateData(Integer numOfcase, Integer numofProd, Integer numofVehicle, String type) {             
        List <case> caseList = new List <case >();             
        
        //Create Vehicle                 
        for (integer i = 0; i < numofVehicle; i++) {                 
            Vehicle__c vc = new Vehicle__c();                 
            vc.name = 'Test Vehicle' + i;                 
            vehicleList.add(vc);             
        }             
        
        insert vehicleList;             
        
        system.assertEquals(vehicleList.size(), 300);             
        
        //Create Equiment             
        for (Integer i = 0; i < numofProd; i++) {                 
            Product2 prod = new Product2();                 
            prod.Name = 'Test Product' + i;                 
            //if(i!=0)                 
            prod.Maintenance_Cycle__c = 1;                
            prod.Replacement_Part__c = true;                 
            prodList.add(prod);             
        }             
        
        upsert prodlist;             
        
        system.assertEquals(prodlist.size(), 300);             
        //Create Case             
        for (Integer i = 0; i < numOfcase; i++) {                 
            Case newCase = new Case();                 
            newCase.Status = 'New';                 
            newCase.Origin = 'web';                 
            if (math.mod(i, 2) == 0)                     
                newCase.Type = 'Routine Maintenance';                 
            else                     
                newCase.Type = 'Repair';                 
            newCase.Subject = 'Routine Maintenance of Vehicle' + i;                 
            newCase.Vehicle__c = vehicleList[i].Id;                 
            if (i < numofProd)                     
                newCase.Equipment__c = prodList.get(i).ID;                 
            else                     
                newCase.Equipment__c = prodList.get(1).ID;                 
            caseList.add(newCase);             
        }             
        
        upsert caseList;             
        
        system.assertEquals(caseList.size(), 300);             
        
        for (Integer i = 0; i < numofProd; i++) {                 
            Equipment_Maintenance_Item__c equipMaintItem1 = new Equipment_Maintenance_Item__c();                 
            equipMaintItem1.Equipment__c = prodlist.get(i).Id;                 
            equipMaintItem1.Maintenance_Request__c = caseList.get(i).id;                 
            equipMaintList.add(equipMaintItem1);                 
            
            Equipment_Maintenance_Item__c equipMaintItem2 = new Equipment_Maintenance_Item__c();                 
            equipMaintItem2.Equipment__c = prodlist.get(i).Id;                 
            equipMaintItem2.Maintenance_Request__c = caseList.get(i).id;                 
            equipMaintList.add(equipMaintItem2);             
        }             
        
        upsert equipMaintList;             
        
        system.assertEquals(equipMaintList.size(), 600);             
        
        return caseList;         
    }     
    
    public static testmethod void testMaintenanceHelper() {         
        Map < Id,case >mapidToCase = new Map < Id,case >();         
        Map < Id, case >mapidTonewCase = new Map < Id, case >();         
        Test.startTest();         
        getData();         
        system.debug('caseList1 ==>' + caseList1.size());        
        Map < Id, Equipment_Maintenance_Item__c > mapIdToEquipmentItem = 
            new Map < Id, Equipment_Maintenance_Item__c > ([Select 
                                                            	Id, 
                                                            	Maintenance_Request__c, 
                                                            	Equipment__c, 
                                                            	Quantity__c, 
                                                            	Maintenance_Request__r.Vehicle__c, 
                                                            	Equipment__r.Maintenance_Cycle__c 
                                                            From 
                                                            	Equipment_Maintenance_Item__c]);   
        
        system.debug('mapIdToEquipmentItem ==>' + mapIdToEquipmentItem.keyset());         
        
        for (Case cas: caseList1) {             
            cas.Status = 'Closed';             
            mapidToCase.put(cas.Id, cas);         
        }         
        
        update caseList1;         
        
        system.assertEquals(300, caseList1.size()); 
        
        List < Case > newCaseList = [Select 
                                     	Id, 
                                     	subject, 
                                     	status, 
                                     	Date_Reported__c, 
                                     	Vehicle__c, Date_Due__c             
                                     from             
                                     	case             
                                     where 
                                     	subject = 'New Routine Maintenance Request' and 
                                     	status = 'New'        
                                    ];         
        
        system.debug('newCaseList ==>' + newCaseList.size());         
        system.assertEquals(caseList1.size(), newCaseList.size());         
        system.assertEquals(300, newCaseList.size());         
        
        for (case cs: newCaseList) {             
            mapidTonewCase.put(cs.Id, cs);             
            
            system.assertEquals(cs.Date_Reported__c, date.today());             
            //system.assertEquals(cs.Vehicle__c,mapidToCase.get(cs.Maintenance_Request__c).Vehicle__c);             
            system.assertEquals(true, cs.Date_Due__c >= date.today());        
        }         
        
        List < Equipment_Maintenance_Item__c > modifiedEquipItemList = [Select 
                                                                        	Id, 
                                                                        	Maintenance_Request__c, 
                                                                        	Equipment__c, 
                                                                        	Quantity__c             
                                                                        From 
                                                                        	Equipment_Maintenance_Item__c            
                                                                        WHERE Maintenance_Request__c in: mapidTonewCase.keyset()];         
        system.assertEquals(false, modifiedEquipItemList.size() > 600);         
        
        for (Equipment_Maintenance_Item__c equipItem: modifiedEquipItemList) {            
            // system.assertEquals(equipItem.Equipment__c, mapIdToEquipmentItem.get(equipItem.Id).Equipment__c);             
            //system.assertEquals(equipItem.Quantity__c, mapIdToEquipmentItem.get(equipItem.Id).Quantity__c);         
        }         
        
        Test.stopTest();     
    } 
}
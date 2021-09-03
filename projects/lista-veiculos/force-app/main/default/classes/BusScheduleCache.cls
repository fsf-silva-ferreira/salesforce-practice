//1 - Create a partition called BusSchedule with 0 MB for the size of org cache and session cache. 
//The 0 MB allocation enables you to test cache misses.

//2 - Create a public Apex class called BusScheduleCache.
public class BusScheduleCache {
	
    //3 - Add this variable to the class: private Cache.OrgPartition part;
    private Cache.OrgPartition part;
    
    //4 - In the constructor, create a new instance of Cache.OrgPartition by passing it the partition name 
    //(local.BusSchedule). 
    //Assign this object to the class variable (part).
    public BusScheduleCache() {
    	part = new Cache.OrgPartition('local.BusSchedule');    
    }
    
    //5 - Add two public methods:
    
    //5a. The first method, putSchedule(), returns void and takes these parameters: String busLine, Time[] schedule. 
    public void putSchedule(String busLine, Time[] schedule) {
		//6 - Implement the putSchedule() method so that it stores the passed-in values in the org cache by using the 
		//partition class variable (part).
		part.put(busLine, schedule);
    }
    
    //5b. The second method, getSchedule(), returns a bus schedule as a time array (Time[]) and takes this parameter: 
    //String busLine.
    public Time[] getSchedule(String busLine) {
        //7 - Implement the getSchedule() method so that it returns the schedule for the specified bus line by using 
        //the partition class variable (part).
        Time[] schedule = (Time[]) part.get(busLine); 
        //8 - Add logic to the getSchedule() method to handle cache misses. If null is returned for the cached value, 
        //getSchedule() should return the following default schedule as a Time array with two Time objects: 
        //one Time object value of 8am and another of 5pm. 
        //Use the Apex Time.newInstance() method to create the Time objects
        if(schedule == null) {
        	Time t1 = Time.newInstance(8,0,0,0);
            Time t2 = Time.newInstance(17,0,0,0);
            
            schedule = new List<Time>();
            schedule.add(t1);
            schedule.add(t2);
        }
        
    	return schedule;   
    }
}
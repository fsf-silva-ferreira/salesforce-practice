({
    // searchBar component firing event on key change
    searchKeyChange : function(component, event, helper) {        
        var searchBarEvent = $A.get("e.c:SearchKeyChange");
        searchBarEvent.setParams({"searchKey" : event.target.value});
        searchBarEvent.fire();
    }
})
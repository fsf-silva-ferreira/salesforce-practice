({
    getNumbers : function(component) {
        var litOfNumbers = [];
        for(var counter=0; counter <= 10; counter++) {
            litOfNumbers.push({value:counter});
        }

        component.set("v.numbers",litOfNumbers);
    }
})
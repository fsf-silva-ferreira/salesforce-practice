/*
    Get Utensils and Ingredients
        Get Teacup
        Get Spoon
        Get Tea Kettle
        Get Teapot
        Get Tea
        Get Sugar
    Boil water in a Tea Kettle
        Fill Kettle with Water
        Switch Kettle On
        Wait for Kettle to Boil
    Make Tea in Teapot
        Put Tea in Teapot
        Put Boiling Water in Teapot
        Wait 2 Minutes
    Add Tea and Sugar to Teacup
        Pour Tea in Teacup
        Put 1 teaspoon of Sugar in Teacup
        Stir Tea in Teacup
    Serve Tea to a Friend
*/

/*
    Anonymous block:

    Teatime.runCollectionsListBasics();
    Teatime.runExpressions();
    Teatime.runIfElseStatement();
    Teatime.runIfElseIfStatement();
    Teatime.runSwtichStatement();
    Teatime.runLogicalOperators();
    Teatime.runWhileLoop();
    Teatime.runDoWhileLoop();
*/
public class Teatime {
    
    Integer numberOfSpoons;
    List<String> groceries = new List<String>{'Tea','Sugar','Honey','Milk'};
    //String[] groceries = new String[4];

    public static void runCollectionsListBasics() {
        String[] groceries = new String[4];
        System.debug('Groceries: ' + groceries);
        
        groceries.add('Tea');
        groceries.add('Sugar');
        System.debug('Added 2 items: ' + groceries);
        
        groceries[1] = 'Honey';
        System.debug('Added Honey in index 1: ' + groceries);
        
        System.debug('Item 0: ' + groceries[0]);
    }

    public static void runExpressions() {
        Integer numberOfTeaCups = 2;

        Boolean numberOfTeaCupsEqualsThree = numberOfTeaCups == 3;
        Boolean numberOfTeaCupsEqualsTwo = numberOfTeaCups == 2;
        Boolean numberOfTeaCupsGreaterThanThree = numberOfTeaCups > 3;
        
        System.debug('numberOfTeaCups == 3? ' + numberOfTeaCupsEqualsThree);
        System.debug('numberOfTeaCups == 2? ' + numberOfTeaCupsEqualsTwo);
        System.debug('numberOfTeaCups > 3? ' + numberOfTeaCupsGreaterThanThree);
    }

    public static void runIfElseStatement() {
        String waterLevel = 'empty'; /*This variable keeps track of the water level status: full or empty*/
  
        if(waterLevel == 'empty') {
            System.debug('Fill the tea kettle');
            waterLevel = 'full'; /*Once the tea kettle is filled the variable is changed to full*/
        } else {
            System.debug('The tea kettle is full');
        }
    }

    public static void runIfElseIfStatement() {
        String waterLevel = 'full';
  
        if(waterLevel == 'empty') {
            System.debug('Fill the tea kettle');
            waterLevel = 'full';
        } else if(waterLevel == 'half') {
            System.debug('Fill the tea kettle');
            waterLevel = 'full';
        } else { /*This statement only runs if line 70 and line 73 result in false.*/
            System.debug('The tea kettle is full');
        }
    }

    public static void runSwtichStatement() {
        String waterLevel = 'half';
  
        //option 1 using a single value
        switch on waterLevel {
            when 'empty' {
                System.debug('Fill the tea kettle');
            }
            when 'half' {
                System.debug('Fill the tea kettle');
            }
            when 'full' {
                System.debug('The tea kettle is full');
            }
            when else {
                System.debug('Error!');
            }
        }
  
        //option 2 using multiple values
        switch on waterLevel {
            when 'empty', 'half' { //when waterLevel is either empty or half
                System.debug('Fill the tea kettle');
            }
            when 'full' {
                System.debug('The tea kettle is full');
            }
            when else {
                System.debug('Error!');
            }
        }
    }

    public static void runLogicalOperators() {
        String waterLevel = 'half';
  
        if(waterLevel == 'empty' || waterLevel == 'half') {
            System.debug('Fill the tea kettle');
            waterLevel = 'full';
        } else { //This statement only runs if line 3 false.
            System.debug('The tea kettle is full');
        }
    }

    public static void runWhileLoop() {
        //Declare an Integer variable called totalGuests and set it to 100
        Integer totalGuests = 100;
        
        //Declare an Integer variable called totalAmountSugar and set it to 159 (number of teaspoons in a bag of sugar).
        Integer totalAmountSugar = 159;
        
        //Declare an Integer variable called totalAmountTea and set it to 35 (number of teabags).
        Integer totalAmountTea = 35;
        
        //Loop: Add a teaspoon of sugar and one tea bag to a tea cup. Serve until there is no sugar or tea left.
        
        While(totalGuests > 0) {
            System.debug(totalGuests + ' Guests Remaining');
            //check ingredients
            if(totalAmountSugar == 0 || totalAmountTea == 0) {
                System.debug('Out of ingredients! Sugar: ' + totalAmountSugar + ' Tea: ' + totalAmountTea);
                break; //ends the While loop
            }
        
            //add sugar
            totalAmountSugar--;
        
            //add tea
            totalAmountTea--;
        
            //guest served
            totalGuests--;
        }
    }

    public static void runDoWhileLoop() {
        //Declare an Integer variable called totalGuests and set it to 100
        Integer totalGuests = 100;
        
        //Declare an Integer variable called totalAmountSugar and set it to 159 (number of teaspoons in a bag of sugar).
        Integer totalAmountSugar = 159;
        
        //Declare an Integer variable called totalAmountTea and set it to 35 (number of teabags).
        Integer totalAmountTea = 35;
        
        do {
            //deduct sugar serving
            totalAmountSugar--;
        
            //deduct tea serving
            totalAmountTea--;
        
            //deduct guest
            totalGuests--;
        
            System.debug(totalGuests + ' Guests Remaining!');
        
            //check ingredients
            if(totalAmountSugar == 0 || totalAmountTea == 0) {
                System.debug('Out of ingredients!');
                break; //ends the While loop
            }
        
        } while(totalGuests > 0);
    }
}
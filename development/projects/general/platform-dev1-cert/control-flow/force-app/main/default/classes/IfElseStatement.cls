/**
 * @description       : Working with if-else statements.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class IfElseStatement {
    
    public static void checkScore(Integer score) {
        if(score > 95) {
            System.debug('You have scored the highest marks');
            System.debug('Congrats!!');
        } else {
            System.debug('Work hard... You will get there');
            System.debug('All the best for next exam!!');
        }
    }

    public static void compareAge(Integer myFriendAge) {
        Integer myAge = 47;

        if(myAge > myFriendAge) {
            System.debug('I am older than my friend');
        } else {
            System.debug('My friend is older than me'); 
        }
    }

    public static void checkPlace(Integer place) {
        String medalColor;

        if(place == 1) {
            medalColor = 'gold';
        } else 
        if(place == 2) {
            medalColor = 'silver';   
        } else
        if(place == 3) {
            medalColor = 'bronze';
        } else {
            //Statement not needed, used here for teaching purposes
            medalColor = null;
        }

        if(medalColor != null) {
            System.debug('You got ' + medalColor + ' medal. Congratulations!'); 
        } else {
            System.debug('You got no medal. Work harder next time.');   
        }
    }
}
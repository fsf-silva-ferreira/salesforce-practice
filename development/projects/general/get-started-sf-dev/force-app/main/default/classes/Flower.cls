/**
 * @description       : Understanding Object-Oriented programming.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class Flower {
    // class variables:
    public String color;
    public Integer height;
    public Integer maxHeight;
    public Integer numberOfPetals;
  
    public static Integer wilt(Integer numberOfPetals){
        if(numberOfPetals >= 1){
            numberOfPetals--;
        }
        System.debug('Number of petals: ' + numberOfPetals);

        return numberOfPetals;
    }
  
    public static void grow(Integer height, Integer maxHeight){
        height = height + 2;
        if(height >= maxHeight) {
            pollinate();
        }
    }
  
    public static void pollinate(){
        System.debug('Pollinating...');
    }
}
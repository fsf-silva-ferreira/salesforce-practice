/**
 * @description       : Working with accessor methods.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-24-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 *
 * Reference:
 * https://stackoverflow.com/questions/3180354/check-if-string-contains-at-least-one-digit
**/
public with sharing class StudentExample2 {

    String name;
    Integer age;

    public void setName(String name) {
        Pattern digitsPattern = Pattern.compile('\\d');
        Matcher digitsMatcher = digitsPattern.matcher(name);
        
        Boolean hasDigits = digitsMatcher.find();
        System.debug('Name has digits? ' + hasDigits);
        if(hasDigits || name=='') {
            this.name = 'My Tutorial Rack';
        } else {
            this.name = name;
        }
    }

    public void setAge(Integer age) {
        if(age<0 || age > 100) {
            this.age = 99;
        } else {
            this.age = age;
        }
    }

    public void display() {
        System.debug('Student name: ' + name);
        System.debug('Student age: ' + age);
    }
}
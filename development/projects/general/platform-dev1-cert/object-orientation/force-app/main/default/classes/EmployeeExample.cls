/**
 * @description       : Practicing constructor overloading.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-25-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class EmployeeExample {

    String name;
    Integer age;
    Integer salary;

    public EmployeeExample() {
        name = 'My Tutorial Rack';
        age = 30;
        salary = 10000;
    }

    public EmployeeExample(String name, Integer age) {
        this.name = name;
        this.age = age;
        this.salary = 40000;
    }

    public EmployeeExample(String name, Integer age, Integer salary) {
        this.name = name;
        this.age = age;
        this.salary = salary;
    }

    public void display() {
        System.debug('Name: ' + name);
        System.debug('Age: ' + age);
        System.debug('Salary: ' + salary);
    }
}
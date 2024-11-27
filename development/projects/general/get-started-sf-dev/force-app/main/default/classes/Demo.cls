/**
 * @description       : Apex introduction.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Based on: https://www.youtube.com/watch?v=KSqvJSUb1D4&list=PL57B82Dd6pFffk4dNNG4XzeBXYpnyEjQt&index=10
**/
public with sharing class Demo {

    private String name;
    private List<String> testList = new List<String>();

    public Demo(String aName) {
        name = aName;
    }

    public static void  displaySimpleHelloWorld() {
        System.debug('Hello World');
    }

    public void showHelloWithName() {
        System.debug('Hello World ' + name);
    }
}
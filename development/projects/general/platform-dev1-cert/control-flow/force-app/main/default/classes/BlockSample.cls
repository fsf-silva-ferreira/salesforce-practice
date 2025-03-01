/**
 * @description       : A block is a series of statements that are grouped with curly braces and can be used in any place where a single statement is allowed. 
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-21-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class BlockSample {
    
    public static void runBlockOfCode() {
        if (true) {
            System.debug(1);
            System.debug(2);
        } else {
            System.debug(3);
            System.debug(4);
        }
    }

    //In cases where a block consists of only one statement, the curly braces can be left off.
    public static void runOneStatementBlock() {
        if (true) 
            System.debug(1);
        else 
            System.debug(2);
    }
}
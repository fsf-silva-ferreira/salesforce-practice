/**
    * @description      : JS class that assigns an Account lista to the wired variable 'accounts'.
    * @author           : Flávio Ferreira
    * @group            : 
    * @created          : 09/12/2021 - 11:42:44
    * 
    * MODIFICATION LOG
    * - Version         : 1.0.0
    * - Date            : 09/12/2021
    * - Author          : fodf
    * - Modification    : 
**/
import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountHelper.getAccountList';

export default class AccountListForEachLWC extends LightningElement {
    @wire(getAccountList) accounts;
}